import * as sessionActions from "../actions/sessionActions";

const sessionReducer = (state = { currentUser: null }, action) => {
    switch(action.type) {
        case sessionActions.RECEIVE_USER:
            return { currentUser: action.user.id };
        case sessionActions.REMOVE_USER:
            return { currentUser: null };
        default:
            return state;
    }
}

export default sessionReducer;