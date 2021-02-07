# load order is important
load "class Ingredient.arb"
load "class Receipe.arb"

# Input
puts "Wie viele Rezepte sollen erstellt werden? "
userInput = gets.chomp
numberOfReceipes = userInput.to_i

# Ingredients
chicken = Ingredient.new("Hühnerbrust", 150, "g")
rice = Ingredient.new("Reis", 300, "g")
paprika = Ingredient.new("Paprika", 2, "Stück")
eggs = Ingredient.new("Eier", 2, "Stück")
noodles = Ingredient.new("Nudeln", 180, "g")
banana = Ingredient.new("Banane", 1, "Stück")
stock = Ingredient.new("Brühe", 200, "ml ")

allIngredients = [chicken, rice, paprika, eggs, noodles, banana]

# Receipes
riceWithChicken = Receipe.new("Rice mit Shice", [chicken, rice])

randomReceipes = Array.new

for i in 0..numberOfReceipes
    randomIngredients = allIngredients.sample(2)
    ingredientNames = randomIngredients.map { |randomIngredient| randomIngredient.name }.join("+")

    receipeName = "Receipe No. #{i} (#{ingredientNames})"
    randomReceipes[i] = Receipe.new(receipeName, randomIngredients)
end

# Shopping list
shoppingList = Hash.new

randomReceipes.each do |receipe|
    receipe.ingredients.each do |ingredient|
        if shoppingList[ingredient].nil?
            shoppingList[ingredient] = ingredient.value
        else 
            shoppingList[ingredient] += ingredient.value
        end
    end

end

# Output
puts "Das sind deine Rezepte" 
randomReceipes.each do |receipe|
    puts "\t#{receipe.name}" 
end

puts ""

puts "Das ist deine Einkaufsliste" 
shoppingList.each do |key, value|
    puts "\t#{key.name}: #{value} #{key.unit}" 
end