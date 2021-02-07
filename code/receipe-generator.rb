require 'io/console'
require 'date'
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
printableReceipes = chef.printReceipes(randomReceipes)
puts ""
printableList = chef.printShoppingList(shoppingList)

fileName = "Wochenplan #{Date.today}.txt"

File.open(fileName, "w") do |file|
    file.write(printableReceipes)
end

File.open(fileName, "a") do |file|
    file.write(printableList)
end

puts "" 
puts "Press any key to end the script..."                                                                                                    
STDIN.getch                                                                                                                                                                                                                       
