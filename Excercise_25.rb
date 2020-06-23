class Product
	attr_reader :p_name, :price, :tax

  def initialize(p_name, price, tax)
  	@p_name = p_name
  	@price = price + (price * tax/100)
  	@tax = tax
  end

  def to_s
  	"Name: #{p_name} Price: #{price}"
  end
end

input = 'y'
products = []
while !(input.eql? 'n')
	tax = 0
  print 'Name of the product: '
  p_name = gets.chomp
  print 'Imported?: '
  imported = gets.chomp
  tax += 5 if imported.casecmp? 'yes'
  print 'Exempted from sales tax?: '
  exempted = gets.chomp
  tax += 10 if exempted.casecmp? 'no'
  print 'Price: '
  price = gets.chomp.to_f
  products << Product.new(p_name, price, tax)
  print 'Do you want to add more items to your list(y/n):'
  input = gets.chomp
end
puts products
sum = products.inject(0) { |sum, product| sum + product.price }
puts "Grand Total: #{sum.round}"
