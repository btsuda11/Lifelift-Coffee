@products.each do |product|
    json.set! product.id do
        json.extract! product, :id, :name, :category, :type, :description, :price, :image_url
    end
end