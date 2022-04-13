# This will delete any existing rows from the Dish and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Rating.destroy_all

Dish.destroy_all
User.destroy_all




puts "Creating users..."
user1 = User.create(name: "BillyBob" ,       location: "Earth")
user2 = User.create(name: "Woobly",          location: "Earth")
user3 = User.create(name: Faker::Name.name , location: "Earth")
user4 = User.create(name: Faker::Name.name , location: "Earth")
user5 = User.create(name: Faker::Name.name , location: "Earth")
you = User.create(name: "Sam",               location: "Earth")




puts "Creating dishes..."
pankcake = Dish.create(name: "Pancakes", intended_to_be: "Sweet", current_price: 10.00)
pasta = Dish.create(name: "Vegan Pasta", intended_to_be: "Spicy", current_price: 8.88)
mac = Dish.create(name: "Mac Cheese", intended_to_be: "Savory", current_price: 4.44)




puts "Creating ratings..."
# *****************************************************************
# * TODO: create ratings! Remember, a rating belongs to a dishes  *
# * and a rating belongs to an user.                              *
# *****************************************************************
# Create Ratings Here

r1 = Rating.create(  

    score: 10,
    reason: "It was Great , yaaaay!",
    recommended_price: 10.00,
    dish_id: pankcake.id,
    user_id: you.id 

)
r2 = Rating.create(  

    score: 1,
    reason: " It was TRRRRASH >:[ ",
    recommended_price: 5.00,
    dish_id: pankcake.id,
    user_id: user1.id 

)





puts "🌱 Seeding done! 🌱

    ✨👏🏾👏🏾👏🏾✨
    If You're Reading This: Your're Doing Great! 
    ✨🙌🏾🙏🏾🙌🏾✨


"