@products.each do |product|
    json.set! product.name.split(' ').join('') do
        json.set! product.id do
            json.extract! product, :name, :image_url
        end
    end
end