@cart_items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :quantity, :shopper_id, :product_id
        json.extract! item.product, :name, :amount, :product_type, :price
        if item.product.photos.attached?
            json.photoUrls item.product.photos.map { |file| file.url }
        else 
            json.photoUrls ""
        end
    end
end

