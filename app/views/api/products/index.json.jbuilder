@products.each do |product|
    json.set! product.name.split(' ').join('') do
        json.set! product.id do
            json.extract! product, :id, :name, :category, :product_type, :description, :price, :image_url
        end
    end
end