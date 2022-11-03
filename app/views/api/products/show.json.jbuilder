json.set! @product.first.name.split(' ').join('') do
    json.array! @product, :id, :name, :amount, :category, :product_type, :description, :price, :image_url
end
