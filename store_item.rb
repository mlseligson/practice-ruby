items = [
  {name: "Allen Iverson Jersey", price: 100, color: "black/red"},
  {name: "Legend of Bagger Vance", price: 55, color: "yellow"},
  {name: "The Bridge Over The River Kwai", price: 20, color: "blue"}
]

class StoreItem
  attr_accessor :name, :price, :color

  def initialize(options)
    @name = options[:name]
    @price = options[:price]
    @color = options[:color]
  end

  def print
    p "The all new #{@name} in color #{@color} will only cost you #{@price}"
  end
end

item1 = StoreItem.new({name: "Allen Iverson Jersey", price: 100, color: "Black/Red"})
item2 = StoreItem.new({name: "Legend of Bagger Vance", price: 55, color: "Yellow"})
item3 = StoreItem.new({name: "The Bridge Over The River Kwai", price: 20, color: "Blue"})

item1.print
item2.print
item3.print

item3.color = "White"

item3.print

