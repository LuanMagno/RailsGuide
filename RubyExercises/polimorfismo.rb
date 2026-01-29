class Forma
  def name
    raise "Nome deve ser implementado pela subclasse"
  end
  def area
    raise "Método deve ser implementado pela subclasse"
  end
  
  def perimetro
    raise "Método deve ser implementado pela subclasse"
  end
end




class Retangulo < Forma
  attr_reader :nome
  def initialize(largura, altura)
    @nome = "retângulo"
    @largura = largura
    @altura = altura
  end
  
  def area
    @largura * @altura
  end
  
  def perimetro
    2 * (@largura + @altura)
  end
end

class Circulo < Forma
    attr_reader :nome
  def initialize(raio)
    @raio = raio
    @nome = "Circulo"
  end
  
  def area
    Math::PI * @raio * @raio
  end
  
  def perimetro
    2 * Math::PI * @raio
  end
end

formas = [
  Retangulo.new(5, 3),
  Circulo.new(2),
  Retangulo.new(10, 4)
]

# Mesmo método, comportamentos diferentes
formas.each do |forma|
  puts "Forma: #{forma.nome}"
  puts "Área: #{forma.area.round(2)}"
  puts "Perímetro: #{forma.perimetro.round(2)}"
  puts "---"
end
