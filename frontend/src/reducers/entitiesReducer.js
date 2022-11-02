import usersReducer from "./usersReducer";
import productsReducer from "./productsReducer";
import { combineReducers } from "redux";
import cartItemsReducer from "./cartItemsReducer";

const entitiesReducer = combineReducers({
    users: usersReducer,
    products: productsReducer,
    cartItems: cartItemsReducer
})

export default entitiesReducer;