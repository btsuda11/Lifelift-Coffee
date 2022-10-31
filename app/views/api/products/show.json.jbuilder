json.product do
    json.extract! @product, :id, :name, :category, :type, :description, :price, :image_url
end