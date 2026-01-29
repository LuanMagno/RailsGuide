require './product.rb'
class Market 
  def initialize(product)
    @product = product
  end

  def buy
    puts "You bought #{@product.name} no valor de #{@product.price}"
  end
end


mango = Product.new("Mango","R$10")
BH = Market.new(mango)
BH.buy