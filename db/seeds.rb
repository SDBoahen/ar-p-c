# This will delete any existing rows from the Dish and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Rating.destroy_all

Dish.destroy_all
User.destroy_all




puts "Creating users..."
user1 = User.create(name: Faker::Name.name, location: "Earth")
user2 = User.create(name: Faker::Name.name, location: "Mars")

user3 = User.create(name: Faker::Name.name, location: "Earth")
# you = User.create(name: "Feel Free To Change This To Your Name")


puts "Creating dishes..."
dish1 = Dish.create(name: "Pancakes", intended_to_be: "Sweet", current_price: 10.00)
dish2 = Dish.create(name: "Vegan Pasta", intended_to_be: "Spicy", current_price: 8.88)

dish3 = Dish.create(name: "Frozen Treat", intended_to_be: "The Greatest Thing Ever", current_price: 3.33)




puts "Creating ratings..."
# *****************************************************************
# * TODO: create ratings! Remember, a rating belongs to a dish  *
# * and a rating belongs to an user.                              *
# *****************************************************************
# Create Ratings Here
Rating.create( 
    score: 9,
    reason: "Pancakes are lit - shrug emoji",
    recommended_price: 7.77,

    user_id: user1.id,
    dish_id: dish1.id
 )

Rating.create( 
    score: 2,
    reason: ":(",
    recommended_price: 5.55,

    user_id: user2.id,
    dish_id: dish1.id
 )

Rating.create( 
    score: 10,
    reason: ":)",
    recommended_price: 10.00,

    user_id: user1.id,
    dish_id: dish1.id
 )



 Rating.create( 
    score: 8,
    reason: ":)))",
    recommended_price: 8.88,

    user_id: user1.id,
    dish_id: dish2.id
 )




puts "🌱 Seeding done! 🌱

    ✨👏🏾👏🏾👏🏾✨
    If You're Reading This: Your're Doing Great! 
    ✨🙌🏾🙏🏾🙌🏾✨


"