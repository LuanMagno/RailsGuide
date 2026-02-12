class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = current_user.entries
  end

  def show
    @entry = current_user.entries.find(params[:id])
  end

  def new
      @entry = Entry.new # Inicializando o entry
    # Ele cria uma instancia vazia do entry model, ele deixa na memória para que assim no futuro a gente consiga colocar os valores que vem do formulário de envio
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      flash[:notice] = "Entry has been saved!"
      redirect_to root_path
    else
      flash[:alert] = "Sorry, there was an issue"
      render :new, status: :unprocessable_entity # Ele renderiza o template /view/entries/new de novo (mantendo os erros do objeto @entry) e retorna o status unprocessable_entity(http422). Se fosse apenas redirect_to new_entry_path, iria perder os valores digitados e os erros de validação, (seria uma requisição nova)
    end
  end

  private
  def entry_params
    # params.require(:entry).permit(:name, :url, :username, :password)- Antes do Rails 8
    params.expect(entry: [ :name, :url, :username, :password ]) # Rails 8, basicamente a mesma coisa que o de cima
  end
end
