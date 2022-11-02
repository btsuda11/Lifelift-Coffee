@cart_items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :quantity, :shopper_id, :product_id
        json.name item.product, :name, :product_type, :price
    end
end

