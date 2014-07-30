class ConexaoDropboxController < ApplicationController
  def index
    #@gerenciador = GerenciadorDropbox.new
    @dados = Dados.new
  end
  
  def create
    @dados = params[:dados]
    redirect_to(action: "show", id: @dados)
  end
  
  def show
    @dados.app_key = params[:id][:app_key]
    @dados.app_secret = params[:id][:app_secret]
  end

end
