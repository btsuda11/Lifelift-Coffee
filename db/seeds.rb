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
    CartItem.destroy_all
    Product.destroy_all
    User.destroy_all

    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User`, `Product`, `CartItem` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('products')
    ApplicationRecord.connection.reset_pk_sequence!('cart_items')

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
        price: 27.95
    })

    medium_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_1.photos.attach(io: medium_file_1, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 1,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 27.95
    })

    Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 1,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 27.95
    })

    Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 27.95
    })

    Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 27.95
    })

    Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 28.95
    })

    Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 1,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 28.95
    })

    medium_2 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85
    })

    medium_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_2.photos.attach(io: medium_file_2, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 3,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 74.85
    })

    Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 3,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 74.85
    })

    Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 74.85
    })

    Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85
    })

    Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 77.85
    })

    Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 3,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 77.85
    })

    medium_3 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70
    })

    medium_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_3.photos.attach(io: medium_file_3, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 6,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 137.70
    })

    Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Ground',
        amount: 6,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 137.70
    })

    Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 137.70
    })

    Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70
    })

    Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 143.70
    })

    Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Ground',
        amount: 6,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 143.70
    })

    medium_4 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 27.95
    })

    medium_file_4 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_4.photos.attach(io: medium_file_4, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 27.95
    })

    Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 1,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 27.95
    })

    Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 27.95
    })

    Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 27.95
    })

    Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 28.95
    })

    Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 1,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 28.95
    })

    medium_5 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85
    })

    medium_file_5 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_5.photos.attach(io: medium_file_5, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 74.85
    })

    Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 3,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 74.85
    })

    Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 74.85
    })

    Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 74.85
    })

    Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 77.85
    })

    Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 3,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 77.85
    })

    medium_6 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70
    })

    medium_file_6 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_6.photos.attach(io: medium_file_6, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 137.70
    })

    Product.create!({
        name: 'Light Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Whole Beans',
        amount: 6,
        description: "The journey to bring you the healthiest coffee on the planet begins on a small farm in the shady mountain rainforests of South America, and it journeys through the hands of local coffee farming experts who hand-select and carefully bring you the only finest specialty Arabica coffee beans. Our lightly roasted coffee selection, bright and ever-so-slightly more acidic, allows you to best savor the authentic, original, true flavor notes of premium Lifelift coffee beans.",
        price: 137.70
    })

    Product.create!({
        name: 'Light Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Your cup of Lifelift Light Roast Coffee Decaf comes from coffee beans that have been individually hand selected as the premium bean(s) of a harvest. Your coffee beans are lovingly cultivated by local farmers, after being grown slowly to full maturity in mountain shade.",
        price: 137.70
    })

    Product.create!({
        name: 'Medium Roast Decaf',
        category: 'Decaf Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 137.70
    })

    Product.create!({
        name: 'Dark Chocolate Sea Salt Caramel',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Single origin, specialty Arabica coffee cherries are grown to peak ripeness, hand selected, spring water washed, and roasted to perfection effortlessly combine with creamy, sinfully sweet caramel, covered in faintly bitter, decadent dark chocolate, with a hint of savory sea salt. The subtle sea salt works to slightly cut the rich, creamy, confectionery caramel flavors as a flood of decadence dances the dark chocolate across your taste buds, all warmly bathed in a waterfall of purely perfect medium roasted coffee. Bold and smooth, decadent and divine, slightly creamy, subtly sweet.",
        price: 143.70
    })

    Product.create!({
        name: 'Amaretto',
        category: 'Flavored Coffee',
        product_type: 'Whole Beans',
        amount: 6,
        description: "Romance meets desire and culminates in indulgence here with our Amaretto Coffee. Sip slowly to savor almonds, lightly toasted, and sweet, succulent apricots drenched in the Lifeboost flavors you love from our medium roasted gourmet Arabica single origin coffee beans, hand selected, bringing you the cream of the crop, and here: the most romantic cup of coffee.",
        price: 143.70
    })

    medium_7 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 1,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 34.95
    })

    medium_file_7 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_7.photos.attach(io: medium_file_7, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Medium Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 1,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    Product.create!({
        name: 'Dark Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 1,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    Product.create!({
        name: 'Medium Roast Decaf Coffee Pods',
        category: 'Coffee Pods',
        amount: 1,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 19.95
    })

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 1,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 34.95
    })

    fuel_1 = Product.create!({
        name: 'Lifelift Fuel',
        category: 'Health Boosters',
        amount: 1,
        description: "Fuel for the mind",
        price: 39.00
    })

    fuel_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/lifelift-fuel/lifelift-fuel.png')
    fuel_1.photos.attach(io: fuel_file_1, filename: "lifelift-fuel.jpeg")

    adapt_1 = Product.create!({
        name: 'HPAdapt Adrenal Drink',
        category: 'Health Boosters',
        amount: 1,
        description: "Adrenal Support",
        price: 49.95
    })

    adapt_file_1 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/hpadapt-adrenal-drink/hpadapt-adrenal-drink.png')
    adapt_1.photos.attach(io: adapt_file_1, filename: "hpadapt-adrenal-drink.jpeg")

    medium_8 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 3,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 89.94
    })

    medium_file_8 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_8.photos.attach(io: medium_file_8, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Medium Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 3,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 47.85
    })

    Product.create!({
        name: 'Dark Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 3,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 47.85
    })

    Product.create!({
        name: 'Medium Roast Decaf Coffee Pods',
        category: 'Coffee Pods',
        amount: 3,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 47.85
    })

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 3,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 89.94
    })

    fuel_2 = Product.create!({
        name: 'Lifelift Fuel',
        category: 'Health Boosters',
        amount: 3,
        description: "Fuel for the mind",
        price: 99.00
    })

    fuel_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/lifelift-fuel/lifelift-fuel.png')
    fuel_2.photos.attach(io: fuel_file_2, filename: "lifelift-fuel.jpeg")

    adapt_2 = Product.create!({
        name: 'HPAdapt Adrenal Drink',
        category: 'Health Boosters',
        amount: 3,
        description: "Adrenal Support",
        price: 119.85
    })

    adapt_file_2 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/hpadapt-adrenal-drink/hpadapt-adrenal-drink.png')
    adapt_2.photos.attach(io: adapt_file_2, filename: "hpadapt-adrenal-drink.jpeg")

    medium_9 = Product.create!({
        name: 'Medium Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 6,
        description: "Careful selection of mature coffee cherries, meticulous processing from fermentation, to spring water washing, to drying and rigorous testing for toxins, to a perfected roasting process makes our low acid coffee beans the healthiest, best tasting, most smooth coffee you’ll ever try. From the local Nicaraguan coffee farmers, to our new and even long time customers, our certified medium roasted Arabica coffee is, by far, our most popular coffee selection.",
        price: 149.40
    })

    medium_file_9 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/light-medium-dark-roasts/medium-roast/medium-roast.jpeg')
    medium_9.photos.attach(io: medium_file_9, filename: "medium-roast.jpeg")

    Product.create!({
        name: 'Medium Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 6,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 89.70
    })

    Product.create!({
        name: 'Dark Roast Coffee Pods',
        category: 'Coffee Pods',
        amount: 6,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 89.70
    })

    Product.create!({
        name: 'Medium Roast Decaf Coffee Pods',
        category: 'Coffee Pods',
        amount: 6,
        description: "Non-GMO, single-origin, specialty coffee.pH test proven to be up to 27.7% less acidic than common store-bought coffees.Shade-grown & sun-dried high in the mountains of Central America.Fairly traded, pesticide-free, & chemical-free, pure antioxidant-rich coffee.No lines, no rationing, delivered directly to your door.These coffee pods are recyclable.Compatible with Keurig and Keurig 2.USDA Organic.10 Pods in each box",
        price: 89.70
    })

    Product.create!({
        name: 'Dark Roast',
        category: 'Light Medium Dark Roasts',
        product_type: 'Go Bags',
        amount: 6,
        description: "Beginning with premium coffee beans, free from the use of pesticides, carefully grown, meticulously processed, then triple tested for toxins, and roasted at higher temperatures for longer times brings you the healthiest dark roast coffee selection possible. A roast commonly referred to as French or Italian, our dark roast selection stands out as a step above with its unique aroma, smooth, full-bodied flavor, and delicious aftertaste.",
        price: 149.40
    })

    fuel_3 = Product.create!({
        name: 'Lifelift Fuel',
        category: 'Health Boosters',
        amount: 6,
        description: "Fuel for the mind",
        price: 180.00
    })

    fuel_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/lifelift-fuel/lifelift-fuel.png')
    fuel_3.photos.attach(io: fuel_file_3, filename: "lifelift-fuel.jpeg")

    adapt_3 = Product.create!({
        name: 'HPAdapt Adrenal Drink',
        category: 'Health Boosters',
        amount: 6,
        description: "Adrenal Support",
        price: 209.70
    })

    adapt_file_3 = URI.open('https://lifelift-coffee.s3.us-west-1.amazonaws.com/health-boosters/hpadapt-adrenal-drink/hpadapt-adrenal-drink.png')
    adapt_3.photos.attach(io: adapt_file_3, filename: "hpadapt-adrenal-drink.jpeg")

    puts "Done!"
end