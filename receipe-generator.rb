# load order is important
load "class Ingredient.arb"
load "class Receipe.arb"

# ingredients
chicken = Ingredient.new("Hühnerbrust", 150)
rice = Ingredient.new("Reis", 300)
paprika = Ingredient.new("Paprika", 2)
eggs = Ingredient.new("Eier", 2)
noodles = Ingredient.new("Nudeln", 180)
banana = Ingredient.new("Banane", 1)

allIngredients = [chicken, rice, paprika, eggs, noodles, banana]

# receipe
riceWithChicken = Receipe.new("Rice mit Shice", [chicken, rice])

randomReceipes = Array.new

for i in 0..5
    randomIngredients = allIngredients.sample(2)
    randomReceipes[i] = Receipe.new("Receipe No. #{i}", randomIngredients)
end

puts randomReceipes.length 

randomReceipes.each do |receipe|
    puts receipe.name
    receipe.ingredients.each do |j|
        puts j.name
    end

end