import { RECEIVE_USER, REMOVE_USER } from "../actions/sessionActions";

const currentUser = JSON.parse(sessionStorage.getItem('currentUser'));

const initialState = currentUser ? { currentUser: currentUser.id } : { currentUser: null };

const sessionReducer = (state = initialState, action) => {
    switch(action.type) {
        case RECEIVE_USER:
            return { ...state, currentUser: action.user.id };
        case REMOVE_USER:
            return { ...state, currentUser: null };
        default:
            return state;
    }
}

export default sessionReducer;