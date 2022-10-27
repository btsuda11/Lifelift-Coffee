import * as sessionActions from "../actions/sessionActions";

const initialState = { currentUser: sessionStorage.getItem('currentUser') }

const sessionReducer = (state = initialState, action) => {
    switch(action.type) {
        case sessionActions.RECEIVE_USER:
            return { ...state, currentUser: action.user.id };
        case sessionActions.REMOVE_USER:
            return { ...state, currentUser: null };
        default:
            return state;
    }
}

export default sessionReducer;