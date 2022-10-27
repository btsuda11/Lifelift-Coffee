import usersReducer from "./usersReducer";
import { combineReducers } from "redux";

const entitiesReducer = combineReducers({
    users: usersReducer
})

export default entitiesReducer;