@products.each do |product|
    json.set! product.name.split(' ').join('') do
        json.name product.name
        if product.photos.attached?
            json.photoUrls product.photos.map { |file| file.url }
        else 
            json.photoUrls ""
        end
    end
end