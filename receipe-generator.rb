load "class Chef.arb"

# Input
puts "Wie viele Rezepte sollen erstellt werden? "
userInput = gets.chomp
numberOfReceipes = userInput.to_i
puts ""

# Create
chef = Chef.new

randomReceipes = chef.getRandomReceipes(numberOfReceipes)
shoppingList = chef.getShoppingListFrom(randomReceipes)

# Output
chef.printReceipes(randomReceipes)
puts ""
chef.printShoppingList(shoppingList)
