class WelcomeController < ApplicationController
  helper_method :conecta_dropbox
  
  def conecta_dropbox

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
end
