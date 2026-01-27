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
```ruby
require #Semelhante ao import 
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
