json.extract! @review, :id, :title, :rating, :product_id, :reviewer_id, :created_at
json.extract! @review.reviewer, :first_name, :last_name