class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: %i[show edit update destroy] # O only é para mostrar apenas nas ações de mostrar/destruir

  def index
    @entries = current_user.entries.search(params[:name])
    @main_entry = @entries.first
  end

  def show
  end

  def new
      @entry = Entry.new # Inicializando o entry
    # Ele cria uma instancia vazia do entry model, ele deixa na memória para que assim no futuro a gente consiga colocar os valores que vem do formulário de envio
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      flash.now[:notice] = "<strong>#{@entry.name}</strong> has been saved!".html_safe
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { } # Tudo que pode ser feito para .html tambem pode ser feito para turbo streams
      end
    else
      render :new, status: :unprocessable_entity # Ele renderiza o template /view/entries/new de novo (mantendo os erros do objeto @entry) e retorna o status unprocessable_entity(http422). Se fosse apenas redirect_to new_entry_path, iria perder os valores digitados e os erros de validação, (seria uma requisição nova)
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      flash.now[:notice] = "#{@entry.name} has been updated."
      respond_to do |format|
      format.html { redirect_to @entry }
      format.turbo_stream { }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    flash.now[:notice] = "#{@entry.name} has been deleted"
    respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { } # Tudo que pode ser feito para .html tambem pode ser feito para turbo streams
      end
  end


  private

  def entry_params
    # params.require(:entry).permit(:name, :url, :username, :password)- Antes do Rails 8
    params.expect(entry: [ :name, :url, :username, :password ]) # Rails 8, basicamente a mesma coisa que o de cima
  end

  def set_entry
    @entry = current_user.entries.find(params[:id])
  end
end
