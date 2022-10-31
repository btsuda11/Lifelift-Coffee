json.product do
    json.extract! @product, :id, :name, :category, :product_type, :description, :price, :image_url
end