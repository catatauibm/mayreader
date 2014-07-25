require 'dropbox_sdk'
require 'yaml'

class GerenciadorDropbox
  def initialize(tirar_isso)
    @config = YAML.load(File.read(Rails.root.join('config/dropbox.yml')))
    
    if tirar_isso == 1
      reiniciar
    end
    
    @client = DropboxClient.new(@config['access_token_secret'])
    # puts "linked account: ", client.account_info().inspect
  end
  
  def reiniciar
        
    flow = DropboxOAuth2FlowNoRedirect.new(@config['app_key'], @config['app_secret'])
    authorize_url = flow.start()
    puts '1. Go to: ' + authorize_url
    puts '2. Click "Allow" (you might have to log in first)'
    puts '3. Copy the authorization code'
    print 'Enter the authorization code here: '
    access_token = gets.strip
    access_token_secret, user_id = flow.finish(access_token)
    
    @config['access_token'] = access_token
    @config['access_token_secret'] = access_token_secret
    @config['user_id'] = user_id
    
    File.open('config/dropbox.yml', 'w') { |f| YAML.dump(@config, f) }
    
  end
  
  
  def upload(nome_arquivo)
    arquivo = open(nome_arquivo)
    response = @client.put_file('/'+@config['folder']+'/'+nome_arquivo, arquivo)
    puts "uploaded: ", response.inspect
  end




  
end