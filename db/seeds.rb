# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
    Product.destroy_all

    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User`, `Product` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')

    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:
    User.create!(
        first_name: 'demo',
        last_name: 'user',
        email: 'demo@user.io', 
        password: 'password'
    )

    # More users
    10.times do 
        fn = Faker::Name.first_name
        ln = Faker::Name.last_name

        User.create!({
            first_name: fn,
            last_name: ln,
            email: "#{fn.downcase}.#{ln.downcase}@gmail.com",
            password: 'password'
        }) 
    end

    puts "Creating products..."
    PRODUCT_TYPES = ['Ground', 'Whole Beans']
    
    PRODUCT_TYPES.each do |type|
        Product.create!({
            name: 'Medium Roast',
            category: 'light-medium-dark-roasts',
            product_type: type,
            description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
            price: 24.60
        })
    end

    Product.create!({
        name: 'Medium Roast',
        category: 'light-medium-dark-roasts',
        product_type: 'Go Bags',
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 30.76
    })

    puts "Done!"
end