json.extract! @cart_item, :id, :quantity, :shopper_id, :product_id
json.extract! @cart_item.product, :name, :amount, :product_type, :price
if @cart_item.product.photos.attached?
    json.photoUrls @cart_item.product.photos.map { |file| file.url }
else 
    json.photoUrls ""
end