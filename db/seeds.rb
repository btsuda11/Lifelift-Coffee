# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    # Unnecessary if using `rails db:seed:replant`
    Review.destroy_all
    CartItem.destroy_all
    Product.destroy_all
    User.destroy_all

    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User`, `Product`, `CartItem` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
    ApplicationRecord.connection.reset_pk_sequence!('cart_items')
    ApplicationRecord.connection.reset_pk_sequence!('reviews')

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
    
    medium_1 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 27.95,
        featured: true
    })

    # medium_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_file_1_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast-2.jpg')
    # medium_1.photos.attach(io: medium_file_1, filename: "medium-roast.jpeg")
    # medium_1.photos.attach{[(io: medium_file_1, filename: "medium-roast.jpeg"), (io: medium_file_1_2, filename: "medium-roast.jpeg")]}

    dark_1 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 1,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 27.95,
        featured: true
    })

    # dark_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_1.photos.attach(io: dark_file_1, filename: "dark-roast.jpeg")

    light_1 = Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 1,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 27.95,
        featured: true
    })

    # light_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/light-roast/light-roast.png')
    # light_1.photos.attach(io: light_file_1, filename: "light-roast.jpeg")

    light_decaf_1 = Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 27.95
    })

    # light_decaf_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/light-decaf/light-decaf.png')
    # light_decaf_1.photos.attach(io: light_decaf_file_1, filename: "light-decaf.jpeg")

    medium_decaf_1 = Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 27.95,
        featured: true
    })

    # medium_decaf_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/medium-roast-decaf/medium-roast-decaf.png')
    # medium_decaf_1.photos.attach(io: medium_decaf_file_1, filename: "medium-roast-decaf.jpeg")

    choc_1 = Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 28.95
    })

    # choc_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/dark-chocolate-sea-salt-caramel/dark-chocolate-sea-salt-caramel.png')
    # choc_1.photos.attach(io: choc_file_1, filename: "dark-chocolate-sea-salt-caramel.jpeg")

    amaretto_1 = Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 28.95
    })

    # amaretto_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/amaretto/amaretto.png')
    # amaretto_1.photos.attach(io: amaretto_file_1, filename: "amaretto.jpeg")

    medium_2 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85,
        featured: true
    })

    # medium_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_2.photos.attach(io: medium_file_2, filename: "medium-roast.jpeg")

    dark_2 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 3,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 74.85,
        featured: true
    })

    # dark_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_2.photos.attach(io: dark_file_2, filename: "dark-roast.jpeg")

    light_2 = Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 3,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 74.85,
        featured: true
    })

    # light_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/light-roast/light-roast.png')
    # light_2.photos.attach(io: light_file_2, filename: "light-roast.jpeg")

    light_decaf_2 = Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 74.85
    })

    # light_decaf_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/light-decaf/light-decaf.png')
    # light_decaf_2.photos.attach(io: light_decaf_file_2, filename: "light-decaf.jpeg")

    medium_decaf_2 = Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85,
        featured: true
    })

    # medium_decaf_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/medium-roast-decaf/medium-roast-decaf.png')
    # medium_decaf_2.photos.attach(io: medium_decaf_file_2, filename: "medium-roast-decaf.jpeg")

    choc_2 = Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 77.85
    })

    # choc_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/dark-chocolate-sea-salt-caramel/dark-chocolate-sea-salt-caramel.png')
    # choc_2.photos.attach(io: choc_file_2, filename: "dark-chocolate-sea-salt-caramel.jpeg")

    amaretto_2 = Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 77.85
    })

    # amaretto_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/amaretto/amaretto.png')
    # amaretto_2.photos.attach(io: amaretto_file_2, filename: "amaretto.jpeg")

    medium_3 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70,
        featured: true
    })

    # medium_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_3.photos.attach(io: medium_file_3, filename: "medium-roast.jpeg")

    dark_3 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 6,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 137.70,
        featured: true
    })

    # dark_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_3.photos.attach(io: dark_file_3, filename: "dark-roast.jpeg")

    light_3 = Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 6,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 137.70,
        featured: true
    })

    # light_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/light-roast/light-roast.png')
    # light_3.photos.attach(io: light_file_3, filename: "light-roast.jpeg")

    light_decaf_3 = Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 137.70
    })

    # light_decaf_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/light-decaf/light-decaf.png')
    # light_decaf_3.photos.attach(io: light_decaf_file_3, filename: "light-decaf.jpeg")

    medium_decaf_3 = Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70,
        featured: true
    })

    # medium_decaf_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/medium-roast-decaf/medium-roast-decaf.png')
    # medium_decaf_3.photos.attach(io: medium_decaf_file_3, filename: "medium-roast-decaf.jpeg")

    choc_3 = Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 143.70
    })

    # choc_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/dark-chocolate-sea-salt-caramel/dark-chocolate-sea-salt-caramel.png')
    # choc_3.photos.attach(io: choc_file_3, filename: "dark-chocolate-sea-salt-caramel.jpeg")

    amaretto_3 = Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 143.70
    })

    # amaretto_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/amaretto/amaretto.png')
    # amaretto_3.photos.attach(io: amaretto_file_3, filename: "amaretto.jpeg")

    medium_4 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 27.95,
        featured: true
    })

    # medium_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_4.photos.attach(io: medium_file_4, filename: "medium-roast.jpeg")

    dark_4 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 27.95,
        featured: true
    })

    # dark_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_4.photos.attach(io: dark_file_4, filename: "dark-roast.jpeg")

    light_4 = Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 1,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 27.95,
        featured: true
    })

    # light_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/light-roast/light-roast.png')
    # light_4.photos.attach(io: light_file_4, filename: "light-roast.jpeg")

    light_decaf_4 = Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 27.95
    })

    # light_decaf_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/light-decaf/light-decaf.png')
    # light_decaf_4.photos.attach(io: light_decaf_file_4, filename: "light-decaf.jpeg")

    medium_decaf_4 = Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 27.95,
        featured: true
    })

    # medium_decaf_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/medium-roast-decaf/medium-roast-decaf.png')
    # medium_decaf_4.photos.attach(io: medium_decaf_file_4, filename: "medium-roast-decaf.jpeg")

    choc_4 = Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 28.95
    })

    # choc_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/dark-chocolate-sea-salt-caramel/dark-chocolate-sea-salt-caramel.png')
    # choc_4.photos.attach(io: choc_file_4, filename: "dark-chocolate-sea-salt-caramel.jpeg")

    amaretto_4 = Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 28.95
    })

    # amaretto_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/amaretto/amaretto.png')
    # amaretto_4.photos.attach(io: amaretto_file_4, filename: "amaretto.jpeg")

    medium_5 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85,
        featured: true
    })

    # medium_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_5.photos.attach(io: medium_file_5, filename: "medium-roast.jpeg")

    dark_5 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 74.85,
        featured: true
    })

    # dark_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_5.photos.attach(io: dark_file_5, filename: "dark-roast.jpeg")

    light_5 = Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 3,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 74.85,
        featured: true
    })

    # light_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/light-roast/light-roast.png')
    # light_5.photos.attach(io: light_file_5, filename: "light-roast.jpeg")

    light_decaf_5 = Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 74.85
    })

    # light_decaf_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/light-decaf/light-decaf.png')
    # light_decaf_5.photos.attach(io: light_decaf_file_5, filename: "light-decaf.jpeg")

    medium_decaf_5 = Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85,
        featured: true
    })

    # medium_decaf_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/medium-roast-decaf/medium-roast-decaf.png')
    # medium_decaf_5.photos.attach(io: medium_decaf_file_5, filename: "medium-roast-decaf.jpeg")

    choc_5 = Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 77.85
    })

    # choc_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/dark-chocolate-sea-salt-caramel/dark-chocolate-sea-salt-caramel.png')
    # choc_5.photos.attach(io: choc_file_5, filename: "dark-chocolate-sea-salt-caramel.jpeg")

    amaretto_5 = Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 77.85
    })

    # amaretto_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/amaretto/amaretto.png')
    # amaretto_5.photos.attach(io: amaretto_file_5, filename: "amaretto.jpeg")

    medium_6 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70,
        featured: true
    })

    # medium_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_6.photos.attach(io: medium_file_6, filename: "medium-roast.jpeg")

    dark_6 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 137.70,
        featured: true
    })

    # dark_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_6.photos.attach(io: dark_file_6, filename: "dark-roast.jpeg")

    light_6 = Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 6,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 137.70,
        featured: true
    })

    # light_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/light-roast/light-roast.png')
    # light_6.photos.attach(io: light_file_6, filename: "light-roast.jpeg")

    light_decaf_6 = Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 137.70
    })

    # light_decaf_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/light-decaf/light-decaf.png')
    # light_decaf_6.photos.attach(io: light_decaf_file_6, filename: "light-decaf.jpeg")

    medium_decaf_6 = Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70,
        featured: true
    })

    # medium_decaf_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/decaf-coffee/medium-roast-decaf/medium-roast-decaf.png')
    # medium_decaf_6.photos.attach(io: medium_decaf_file_6, filename: "medium-roast-decaf.jpeg")

    choc_6 = Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 143.70
    })

    # choc_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/dark-chocolate-sea-salt-caramel/dark-chocolate-sea-salt-caramel.png')
    # choc_6.photos.attach(io: choc_file_6, filename: "dark-chocolate-sea-salt-caramel.jpeg")

    amaretto_6 = Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 143.70
    })

    # amaretto_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/flavored-coffee/amaretto/amaretto.png')
    # amaretto_6.photos.attach(io: amaretto_file_6, filename: "amaretto.jpeg")

    medium_7 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 34.95,
        featured: true
    })

    # medium_file_7 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_7.photos.attach(io: medium_file_7, filename: "medium-roast.jpeg")

    medium_pod_1 = Product.create!({
        name: 'Medium Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 1,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    # medium_pod_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/medium-roast-coffee-pods/medium-roast-coffee-pods.png')
    # medium_pod_1.photos.attach(io: medium_pod_file_1, filename: "medium-roast-coffee-pods.jpeg")

    dark_pod_1 = Product.create!({
        name: 'Dark Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 1,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    # dark_pod_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/dark-roast-coffee-pods/dark-roast-coffee-pods.png')
    # dark_pod_1.photos.attach(io: dark_pod_file_1, filename: "dark-roast-coffee-pods.jpeg")

    medium_decaf_pod_1 = Product.create!({
        name: 'Medium Roast Decaf Coffee Pods',
        category: 'Coffee Pods',
        amount: 1,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    # medium_decaf_pod_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/medium-roast-decaf-coffee-pods/medium-roast-decaf-coffee-pods.png')
    # medium_decaf_pod_1.photos.attach(io: medium_decaf_pod_file_1, filename: "medium-roast-decaf-coffee-pods.jpeg")

    dark_7 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 1,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 34.95,
        featured: true
    })

    # dark_file_7 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_7.photos.attach(io: dark_file_7, filename: "dark-roast.jpeg")

    fuel_1 = Product.create!({
        name: 'Lifelift Fuel',
        category: 'Health Boosters',
        amount: 1,
        description: "Fuel for the mind",
        price: 39.00
    })

    # fuel_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/lifelift-fuel/lifelift-fuel.png')
    # fuel_1.photos.attach(io: fuel_file_1, filename: "lifelift-fuel.jpeg")

    adapt_1 = Product.create!({
        name: 'HPAdapt Adrenal Drink',
        category: 'Health Boosters',
        amount: 1,
        description: "Adrenal Support",
        price: 49.95
    })

    # adapt_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/hpadapt-adrenal-drink/hpadapt-adrenal-drink.png')
    # adapt_1.photos.attach(io: adapt_file_1, filename: "hpadapt-adrenal-drink.jpeg")

    medium_8 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 89.94,
        featured: true
    })

    # medium_file_8 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_8.photos.attach(io: medium_file_8, filename: "medium-roast.jpeg")

    medium_pod_2 = Product.create!({
        name: 'Medium Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 3,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 47.85
    })

    # medium_pod_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/medium-roast-coffee-pods/medium-roast-coffee-pods.png')
    # medium_pod_2.photos.attach(io: medium_pod_file_2, filename: "medium-roast-coffee-pods.jpeg")

    dark_pod_2 = Product.create!({
        name: 'Dark Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 3,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 47.85
    })

    # dark_pod_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/dark-roast-coffee-pods/dark-roast-coffee-pods.png')
    # dark_pod_2.photos.attach(io: dark_pod_file_2, filename: "dark-roast-coffee-pods.jpeg")

    medium_decaf_pod_2 = Product.create!({
        name: 'Medium Roast Decaf Coffee Pods',
        category: 'Coffee Pods',
        amount: 3,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 47.85
    })

    # medium_decaf_pod_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/medium-roast-decaf-coffee-pods/medium-roast-decaf-coffee-pods.png')
    # medium_decaf_pod_2.photos.attach(io: medium_decaf_pod_file_2, filename: "medium-roast-decaf-coffee-pods.jpeg")

    dark_8 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 3,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 89.94,
        featured: true
    })

    # dark_file_8 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_8.photos.attach(io: dark_file_8, filename: "dark-roast.jpeg")

    fuel_2 = Product.create!({
        name: 'Lifelift Fuel',
        category: 'Health Boosters',
        amount: 3,
        description: "Fuel for the mind",
        price: 99.00
    })

    # fuel_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/lifelift-fuel/lifelift-fuel.png')
    # fuel_2.photos.attach(io: fuel_file_2, filename: "lifelift-fuel.jpeg")

    adapt_2 = Product.create!({
        name: 'HPAdapt Adrenal Drink',
        category: 'Health Boosters',
        amount: 3,
        description: "Adrenal Support",
        price: 119.85
    })

    # adapt_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/hpadapt-adrenal-drink/hpadapt-adrenal-drink.png')
    # adapt_2.photos.attach(io: adapt_file_2, filename: "hpadapt-adrenal-drink.jpeg")

    medium_9 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 149.40,
        featured: true
    })

    # medium_file_9 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    # medium_9.photos.attach(io: medium_file_9, filename: "medium-roast.jpeg")

    medium_pod_3 = Product.create!({
        name: 'Medium Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 6,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 89.70
    })

    # medium_pod_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/medium-roast-coffee-pods/medium-roast-coffee-pods.png')
    # medium_pod_3.photos.attach(io: medium_pod_file_3, filename: "medium-roast-coffee-pods.jpeg")

    dark_pod_3 = Product.create!({
        name: 'Dark Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 6,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 89.70
    })

    # dark_pod_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/dark-roast-coffee-pods/dark-roast-coffee-pods.png')
    # dark_pod_3.photos.attach(io: dark_pod_file_3, filename: "dark-roast-coffee-pods.jpeg")

    medium_decaf_pod_3 = Product.create!({
        name: 'Medium Roast Decaf Coffee Pods',
        category: 'Coffee Pods',
        amount: 6,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 89.70
    })

    # medium_decaf_pod_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/coffee-pods/medium-roast-decaf-coffee-pods/medium-roast-decaf-coffee-pods.png')
    # medium_decaf_pod_3.photos.attach(io: medium_decaf_pod_file_3, filename: "medium-roast-decaf-coffee-pods.jpeg")

    dark_9 = Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 6,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 149.40,
        featured: true
    })

    # dark_file_9 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/dark-roast/dark-roast.png')
    # dark_9.photos.attach(io: dark_file_9, filename: "dark-roast.jpeg")

    fuel_3 = Product.create!({
        name: 'Lifelift Fuel',
        category: 'Health Boosters',
        amount: 6,
        description: "Fuel for the mind",
        price: 180.00
    })

    # fuel_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/lifelift-fuel/lifelift-fuel.png')
    # fuel_3.photos.attach(io: fuel_file_3, filename: "lifelift-fuel.jpeg")

    adapt_3 = Product.create!({
        name: 'HPAdapt Adrenal Drink',
        category: 'Health Boosters',
        amount: 6,
        description: "Adrenal Support",
        price: 209.70
    })

    # adapt_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/hpadapt-adrenal-drink/hpadapt-adrenal-drink.png')
    # adapt_3.photos.attach(io: adapt_file_3, filename: "hpadapt-adrenal-drink.jpeg")

    inflamega_1 = Product.create!({
        name: 'Inflamega',
        category: 'Health Boosters',
        amount: 1,
        description: "Inflammation Support",
        price: 49.95
    })

    # inflamega_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/inflamega/inflamega.png')
    # inflamega_1.photos.attach(io: inflamega_file_1, filename: "inflamega.jpeg")

    inflamega_2 = Product.create!({
        name: 'Inflamega',
        category: 'Health Boosters',
        amount: 3,
        description: "Inflammation Support",
        price: 119.85
    })

    # inflamega_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/inflamega/inflamega.png')
    # inflamega_2.photos.attach(io: inflamega_file_2, filename: "inflamega.jpeg")

    inflamega_3 = Product.create!({
        name: 'Inflamega',
        category: 'Health Boosters',
        amount: 6,
        description: "Inflammation Support",
        price: 167.70
    })

    # inflamega_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/inflamega/inflamega.png')
    # inflamega_3.photos.attach(io: inflamega_file_3, filename: "inflamega.jpeg")

    puts "Done!"
end