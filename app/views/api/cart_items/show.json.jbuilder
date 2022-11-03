json.extract! @cart_item, :id, :quantity, :shopper_id, :product_id
json.extract! @cart_item.product, :name, :amount, :product_type, :price



