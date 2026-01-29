module Auditavel
  def log_acao(acao)
    puts "[#{Time.now}] #{acao}"
  end
end

class Usuario
  include Auditavel
  
  def criar
    log_acao("Usuário criado")
  end
end

user = Usuario.new()
user.criar()