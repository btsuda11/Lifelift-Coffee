import usersReducer from "./usersReducer";
import productsReducer from "./productsReducer";
import { combineReducers } from "redux";
import cartItemsReducer from "./cartItemsReducer";
import reviewsReducer from "./reviewsReducer";

const entitiesReducer = combineReducers({
    users: usersReducer,
    products: productsReducer,
    cartItems: cartItemsReducer,
    reviews: reviewsReducer
})

export default entitiesReducer;