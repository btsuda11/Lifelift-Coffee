@products.each do |product|
    json.set! product.name.split(' ').join('') do
        json.name product.name
        json.numReviews product.reviews.length
        json.avgRating product.reviews.empty? ? 0 : (((product.reviews.inject(0) { |acc, a| acc + a.rating }) / (product.reviews.length * 1.0)) * 2.0).round / 2.0
        if product.photos.attached?
            json.photoUrls product.photos.map { |file| file.url }
        else 
            json.photoUrls ""
        end
    end
end