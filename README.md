# Lifelift Coffee

[Click to view!](https://lifeliftcoffee.onrender.com/)

## Background
---
Lifelift Coffee is a website clone of a U.S. based health-conscious coffee company, [Lifeboost Coffee](https://lifeboostcoffee.com/). The brand features a clean and modern website interface that is easy to navigate and allows users to purchase different roasts of coffee.
<br>
<br>

## Technologies Implemented
---
* AWS S3
* render.com
* HTML5 and CSS
* JavaScript/AJAX/Jbuilder
* React/Redux
* Ruby on Rails
* SwiperJS
<br>
<br>

## Features

### User Authentication - New account creation, login, demo login
---
Lifelift Coffee features a fully functional user authentication system with a demo user login and error handling for invalid entries. The sign up page is accessible from the login page, allowing the user to easily transition between pages. Additionally, the user is automatically redirected to the login page upon attempting to checkout from the cart if not logged in, for ease of access.
<br>
<br>

![](/frontend/src/assets/README/feature1.png)
<br>
<br>

### Product Pages/Reviews
---
Each product features a show page where users can view information about the product, the purchase options that are available, and its reviews. If logged in, the user can add the selected option to their cart and leave, edit, or delete their own reviews. The reviews section is ordered chronologically from most to least recent and updates the average star rating and rating breakdown upon submission of new reviews. The review form also has complete error handling, showing an error underneath the input field that is incomplete.
<br>
<br>

![](/frontend/src/assets/README/feature2.png)
![](/frontend/src/assets/README/feature3.png)
<br>
<br>

The code snippet below handles the logic for whether the review form creates a new review or updates an existing review. If a review is not passed down through the props of this component and therefore, does not have preexisting information, the review's input fields are set to their defaults for a new review. The useState hook is used to keep track of changes for each of the review's contents.
<br>
<br>

```javascript
// frontend/src/components/reviews/ReviewForm/index.jsx
if (!review) review = {reviewerName: '', title: '', body: '', rating: 5, reviewerId: '', productId: ''}

const [reviewerName, setReviewerName] = useState(review.reviewerName);
const [selectedNameFormat, setSelectedNameFormat] = useState('John Smith');
const [clickedRating, setClickedRating] = useState(clickedStates);
const [title, setTitle] = useState(review.title);
const [body, setBody] = useState(review.body);
```
<br>

### Cart 
---
Clicking on the cart icon in the navigation bar in the header will open the cart sidebar. The user can update the quantity of each item and remove each item from their cart. The price and quantity badge on the cart icon dynamically update according to each user's cart. Additionally, clicking the checkout button will clear the user's cart, show a "Thank You" modal, and redirect to the user's account page.
<br>
<br>

![](/frontend/src/assets/README/feature4.png)
<br>
<br>

The following code snippet handles the logic for updating and removing items from the cart. Each function dispatches a different action to the Redux reducer, which will modify the store to handle the incoming action. The decrement quantity function will decrease an item's quantity by one, unless if the quantity is already one, then it will remove the item from the cart.
<br>
<br>

```javascript
// frontend/src/components/cart/CartItem/index.jsx
const removeItem = e => {
    e.preventDefault();
    dispatch(deleteCartItem(item.id));
}

const incrementQuantity = () => {
    dispatch(updateCartItem({ ...item, quantity: item.quantity + 1 }));
}

const decrementQuantity = () => {
    if (item.quantity === 1) {
        dispatch(deleteCartItem(item.id));
    } else {
        dispatch(updateCartItem({ ...item, quantity: item.quantity - 1 }));
    }
}
```
<br>

### Search Bar
---
Clicking on the search icon in the navigation bar in the header will redirect the user to the search page, where the user can search for products by name. If the search yields results, then the products will show up, each with a short description and button to their corresponding show pages. However, if the search does not yield results, it will show an error message.
<br>
<br>

![](/frontend/src/assets/README/feature5.png)
<br>
<br>