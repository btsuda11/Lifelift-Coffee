json.cartItem do
    json.set! @cart_item.product_id do
        json.extract! @cart_item, :id, :quantity, :size, :price, :shopper_id, :product_id
    end
end

