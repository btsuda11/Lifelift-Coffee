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
            category: 'Light Medium Dark Roasts',
            product_type: type,
            description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
            price: 27.95
        })

        Product.create!({
            name: 'Embolden Dark Roast',
            category: 'Light Medium Dark Roasts',
            product_type: type,
            description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
            price: 27.95
        })

        Product.create!({
            name: 'Light Decaf',
            category: 'Decaf Coffee',
            product_type: type,
            description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
            price: 27.95
        })

        Product.create!({
            name: 'Medium Roast Decaf',
            category: 'Decaf Coffee',
            product_type: type,
            description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
            price: 27.95
        })

        Product.create!({
            name: 'Dark Chocolate Sea Salt Caramel',
            category: 'Flavored Coffee',
            product_type: type,
            description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
            price: 28.95
        })

        Product.create!({
            name: 'Southern Pecan',
            category: 'Flavored Coffee',
            product_type: type,
            description: "Ruby red, plump coffee cherries are singly picked by hand, each one inspected for quality, fermented, spring water washed, dried, tested for toxins, and roasted to a medium level to preserve their unique flavors. These carefully selected beans are then introduced to toasted, buttery, southern pecans, selected just as carefully, harvested just as meticulously. Brewing this gourmet selection awakens the senses as the smoothness of the buttery, nutty pecans and chocolate and caramel undertones of the coffee meet and mingle in your cup.",
            price: 28.95
        })

        Product.create!({
            name: 'Amaretto',
            category: 'Flavored Coffee',
            product_type: type,
            description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
            price: 28.95
        })
    end

    Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 34.95
    })

    Product.create!({
        name: 'Medium Roast Coffee Pods',
        category: 'Coffee Pods',
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    Product.create!({
        name: 'Dark Roast Coffee Pods',
        category: 'Coffee Pods',
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    Product.create!({
        name: 'Medium Roast Decaf Coffee Pods',
        category: 'Coffee Pods',
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    Product.create!({
        name: 'Embolden Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 34.95
    })

    Product.create!({
        name: 'Lifelift Fuel',
        category: 'Health Boosters',
        description: "Fuel for the mind",
        price: 39.00
    })

    Product.create!({
        name: 'HPAdapt Adrenal Drink',
        category: 'Health Boosters',
        description: "Adrenal Support",
        price: 49.95
    })

    puts "Done!"
end