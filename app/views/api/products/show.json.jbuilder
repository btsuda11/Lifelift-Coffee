json.set! @product.first.name.split(' ').join('') do
    json.array! @product do |option|
        json.extract! option, :id, :name, :amount, :category, :product_type, :description, :price
        if option.photos.attached?
            json.photoUrls option.photos.map { |file| file.url }
        else 
            json.photoUrls ""
        end
    end
end
