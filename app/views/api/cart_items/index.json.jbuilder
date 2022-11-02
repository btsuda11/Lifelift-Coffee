json.cartItems do
    @cart_items.each do |item|
        json.set! item.id do 
            json.extract! item, :id, :quantity, :size, :price, :shopper_id, :product_id
        end
    end
end

json.products do
    cart_items = @cart_items.includes(:product)
    cart_items.each do |item|
        json.set! item.product.id do 
            json.extract! item.product, :id, :name, :product_type, :price, :image_url
        end
    end
end