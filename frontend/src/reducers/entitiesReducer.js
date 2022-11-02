import usersReducer from "./usersReducer";
import productsReducer from "./productsReducer";
import { combineReducers } from "redux";

const entitiesReducer = combineReducers({
    users: usersReducer,
    products: productsReducer
})

export default entitiesReducer;