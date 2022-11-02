import { RECEIVE_PRODUCTS, RECEIVE_PRODUCT } from '../actions/productActions';

const productsReducer = (state = {}, action) => {
    Object.freeze(state);
    const newState = { ...state };
    
    switch(action.type) {
        case RECEIVE_PRODUCTS:
            return { ...action.products };
        case RECEIVE_PRODUCT:
            return { ...action.payload };
        default:
            return state;
    }
}

export default productsReducer;