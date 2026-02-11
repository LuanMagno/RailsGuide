# Purpose 
Study repository for learning Ruby on Rails based on the [Udemy Course](https://www.udemy.com/course/ruby-on-rails-8-and-hotwire-build-a-password-manager/learn/lecture/49862417?start=0#overview) and the official [Rails Guides](rubyonrails.org).

## Goals
- Learn Rails fundamentals
- Practice concepts with examples and projects
- Explore additional tools, gems, and concepts beyond the Rails Guides

-----
### Written Pattern
Ruby
```ruby
#Variáveis/Métodos -> snake_case
user_name = "Seu nome"

#Classes/Módulos -> CamelCase
class UserProfile
end

module AdminArea
end

#Constants -> SCREAMING_SNAKE_CASE
MAX_LOGIN_ATTEMPTS = 5
``` 
Ruby on Rails
```ruby
#ClassName -> singular + CamelCase
class User < ApplicationRecord
end

#ArchiveName -> singular + snake_case
app/models/user.rb
```
Plural
- Controllers
- Views
- Variáveis de coleção
- Rotas
- Tabela banco de dados

Singular
- Models (classes)
- Métodos/Variáveis

Arquivos seguem o nome da classe/conceito mas sempre em snake_case

-----
### Ruby Anottations
#### POO
DUCK TYPING

    "Se anda como um pato, grasna como um pato, então é um pato".

O tipo do objeto não importa contanto que ele implemente os métodos necessários. Você não checa a classe e sim se o objeto responde aos métodos que queremos chamar

```ruby
class EmailNotificador
  def enviar(mensagem)
    puts "📧 Email: #{mensagem}"
  end
end

class SlackNotificador
  def enviar(mensagem)
    puts "💬 Slack: #{mensagem}"
  end
end

class SMSNotificador
  def enviar(mensagem)
    puts "📱 SMS: #{mensagem}"
  end
end

class SistemaNotificacao
  def initialize
    @notificadores = []
  end
  
  def adicionar_notificador(notificador)
    @notificadores << notificador #Adiciona vetor de notificadores
  end
  
  def notificar_todos(mensagem) #Mesmo sendo classes diferentes, todas possuem o método enviar igual portanto funciona em todas
    @notificadores.each do |notificador| #Como se fosse um for each notificador in notificadores do {}
      notificador.enviar(mensagem)  # Polimorfismo!
    end
  end
end

# Uso polimórfico
sistema = SistemaNotificacao.new
sistema.adicionar_notificador(EmailNotificador.new)
sistema.adicionar_notificador(SlackNotificador.new)
sistema.adicionar_notificador(SMSNotificador.new)

sistema.notificar_todos("Sistema atualizado!")
```

Self
```ruby
#Semelhante a uma classe static no C#, não precisa instanciar uma variável 
Class Produto
    def self.categoria_padrao
        "Geral"
    end
end

Produto.categoria_padrao #Geral
```

MODULES
-Não podem ser instanciados
-Namespaces: organizar código
-Mixins: compartilhar funcionalidades

```ruby
# Como Namespace
module Financeiro
  class Conta
    def saldo
      @saldo ||= 0 #||= é como se fosse um operador que checa a primeira afirmação e se ela não for verdade vai setar ela com o valor da segunda. (Se o @saldo não existir ele vai setar o saldo como 0)
    end
  end
end

conta = Financeiro::Conta.new
# O sinal "::" Está falando para o Ruby procurar Conta no escopo Financeiro

#:: Também pode ser usado para ignorar escopo
class Car #Escopo global
end

module Vehicle
  module Car #Como se fosse Vehicle::Car
  end

  my_global_car = ::Car.new # Ta referenciando o carro no escopo global, não no local(Dentro de veículo)
end

# Como Mixin
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
```
-----
Lambda - Podem ser usadas como argumentos de outras funções e partes do código.
```ruby
my_lambda = lambda { |x| x * 2 }
# ou
my_lambda = ->(x) { x * 2 }

resultado = my_lambda.call(x) 
```
Constructor
```ruby
class Person
    def initialize(name, age) #Diferente do C# que o construtor tem o mesmo nome da classe,no Ruby é usado initialize
        @name = name
        @age = age
    end
end

person = Person.new('Luan', 19)  #No ruby o . é usado especificamente para acessar métodos, não para acessar propriedades diretamente   
```
Variables
```ruby
@@class_variable # 2@, valor compartilhado entre todas as instâncias de sua classe e pode ser acessada em qualquer lugar

$global #Variável global

@instance_variable #Usa apenas um @, o valor não é compartilhado entre todas as instâncias da classe
```
No C#, as variáveis de instância seriam o equivalente a declarar a variável na classe em si em vez de dentro de uma função, para evitar o excesso desnecessário de código existe o attr_acessor

#### Instance
```ruby
class Dog
    def name
        @name #Acessa a variável, ela é criada na primeira instância
    end

    def name=(name)
        @name = name  #Para atribuir o name 
    end

    def age
        @age
    end

    def age(age) #Outro jeito de atribuir, não precisa do =
        @age = age #Fazendo a mesma coisa para age
    end
end

#A chamada muda dependendo de como foi declarada
dog = Dog.new
dog.name = "cachorro" #para name=(name)
dog.age(5) #para age(age)
```
#### attr_acessor
Tomar cuidado se a variável precisar de validação, não usar se o atributo não pode ser alterado depois. Não usar também quando vier de outros atributos

```ruby
class Dog
    attr_accessor :name, :age #Cria os getters e setters para os atributos informados

    attr_reader :name #Apenas para leitura
    attr_writer :password #Apenas escrita
end
```

```ruby
require #Semelhante ao import (A ordem do require importa)
require_relative '' #Usar o require relative pois é independente do arquivo que eu estou executando 
gets.chomp = Console.ReadLine()

Unless = if not 
```
Switch-case
```ruby
month = gets.chomp.to_i #parse.Int in Java

case month
when 1..3
    puts 'First quarter'
when 4..6
    puts 'Second quarter'
when 7..9
    puts 'Third quarter'
when 9..12
    puts 'Last quarter of the year'
else #Similar to the Java default, when none of the options above is correct
    puts 'It wasnt possible to categorize.'
```
Collections
```ruby
#Push para adicionar, insert na posicao que quiser, pode ser usado em intervalos
array[1..5] #posição 1 até 5

#No ruby pode chamar array de trás para frente (começar usando numero negativo)
array[-1]#Pega o último o -2 o penúltimo e assim por diante, não existe -0

#Hash é como se fosse um dicionario, parecido com o array mas você não armazena número e sim valores
capitais = Hash.new
capitais = {acre: 'Rio Branco', sao_paulo: 'São Paulo'}
capitais = [:minas_gerais] = "Belo Horizonte" #Formas de adicionar no hash
capitais.delete(:acre)

names = ['Luan', 'Rafael', 'Arthur']
names.each do |name| #Como se fosse o for each name in names
    puts name
end 

array.map do |a| #Cria um novo array 
array.map! #Substitui o conteúdo do próprio array
```
-----
### Rails Anottations
#### Structure
APP

  Bin -> Rails scripts

  Assets

  Builds -> Onde o css e JS vai ser compilado

  Controllers -> Lidam com todas as requisições, expôe o modelo para a web, processa parametros, renderiza templates, etc

  Helpers -> Deixar o código limpo de qualquer regra de negócio ou código excessivo

  Models -> Camada do banco de dados, geralmente representa 1 tabela em um banco de dados

  Views -> UI que vai ser vista pelos usuários

-Ao adicionar uma página nova, primeiro adicionar a rota dela e depois o controller e model

-----
- Em rails, todo arquivo que começa com underscore "_navbar" é um partial
- - Partials = Um pedaço reutilizável do view (navbar,footer,forms, etc)
- Helpers são basicamente módulos (Te permitem encapsular código e importar eles facilmente)
 -----
 ##### Hotwire - HTML Over the Wire
O servidor manda o html pronto e não o json. Feito para usar o JavaScript apenas quando é necessário e deixar a maior parte da complexidade no servidor Rails

 Composto por 3 partes:
 - Turbo: Responsável pela navegação e atualização da tela sem recarregar tudo (reload) incluindo envio de forms, atualização de parte da tela autoamticamente etc
 - Stimulus: Framework JavaScript mínimo usado pra adicionar comportamento ao HTML, lidando com interações do usuário e eventos do frontend de forma simples e organizada
 - Strada: Integração entre partes web e apps nativos, permitindo uma comunicação com código nativo do mobile


