import { RECEIVE_USER, REMOVE_USER } from "../actions/sessionActions";

const currentUser = JSON.parse(sessionStorage.getItem('currentUser'));

const initialState = currentUser ? { [currentUser.id]: currentUser } : {}

const usersReducer = (state = initialState, action) => {
    switch(action.type) {
        case RECEIVE_USER:
            return { ...state, [action.user.id]: action.user };
        case REMOVE_USER:
            let newState = { ...state };
            delete newState[action.userId];
            return newState;
        default:
            return state;
    }
}

export default usersReducer;