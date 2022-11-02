json.cartItems do
    @cart_items.each do |item|
        json.set! item.product_id do 
            json.extract! item, :id, :quantity, :size, :price, :shopper_id, :product_id
        end
    end
end
