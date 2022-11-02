@products.each do |product|
    json.set! product.name.split(' ').join('') do
        json.name product.name
        json.image_url product.image_url
    end
end