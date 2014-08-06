class ConexaoDropboxController < ApplicationController
  def index
    #@gerenciador = GerenciadorDropbox.new
    #@dados = Dados.new
  end
  
  def create
    @dados = params[:dados]
    redirect_to(action: "show", id: @dados)
  end
  
  def show
    @dados.app_key = params[:id][:app_key]
    @dados.app_secret = params[:id][:app_secret]
  end
  
  def iniciar
    begin
      @dados = YAML.load(File.read(Rails.root.join('config/dropbox.yml')))
    rescue exception => e
        
      flow = DropboxOAuth2FlowNoRedirect.new(@dados['app_key'], @dados['app_secret'])
      authorize_url = flow.start()
      puts '1. Go to: ' + authorize_url
      puts '2. Click "Allow" (you might have to log in first)'
      puts '3. Copy the authorization code'
      print 'Enter the authorization code here: '
      access_token = gets.strip
      access_token_secret, user_id = flow.finish(access_token)
      
      @dados['access_token'] = access_token
      @dados['access_token_secret'] = access_token_secret
      @dados['user_id'] = user_id
      
      File.open('config/dropbox.yml', 'w') { |f| YAML.dump(@dados, f) }
    end
    
    @client = DropboxClient.new(@dados['access_token_secret'])
    # puts "linked account: ", client.account_info().inspect

  end
  
  
  
  def upload(nome_arquivo)
    arquivo = open(nome_arquivo)
    response = @client.put_file("/#{@dados['folder']}/#{nome_arquivo}", arquivo)
    puts "uploaded: ", response.inspect
  end

  def download(nome_arquivo)
    contents, metadata = client.get_file_and_metadata("/#{@dados['folder']}/#{nome_arquivo}")
    # open(nome_arquivo, 'w') {|f| f.puts contents }
  end

    # flow = DropboxOAuth2FlowNoRedirect.new(@usuario.dropbox_key, @usuario.dropbox_secret)
    # authorize_url = flow.start()
    # puts '1. Go to: ' + authorize_url
    # puts '2. Click "Allow" (you might have to log in first)'
    # puts '3. Copy the authorization code'
    # print 'Enter the authorization code here: '
    # code = gets.strip
    # access_token, user_id = flow.finish(code)
# 
    # puts access_token
    # puts user_id
# 
#     
    # access_token = 'Yw5dQlfMV_sAAAAAAAAAMoVuNU6h6mC_shbsQWZI1_I5EkTxu4UB9QhGOEN7AAcf'
    # user_id = 7481546
#     
#   
    # client = DropboxClient.new(access_token)
    # puts "linked account: ", client.account_info().inspect
#     
    # file = open('arq.xml')
    # response = client.put_file('/mayreader/arq_drop.xml', file)
    # puts "uploaded: ", response.inspect
    
    
    
    # box = GerenciadorDropbox.new #1
#     
    # box.upload "arq.xml"


end
