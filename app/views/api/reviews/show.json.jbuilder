json.extract! @review, :id, :title, :body, :rating, :product_id, :reviewer_id
json.createdAt @review.created_at.to_date.strftime '%m/%d/%y'
json.extract! @review.reviewer, :first_name, :last_name