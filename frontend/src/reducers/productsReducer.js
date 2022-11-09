import { RECEIVE_PRODUCTS, RECEIVE_PRODUCT, RECEIVE_FEATURED_PRODUCT, REMOVE_PRODUCTS } from '../actions/productActions';

const productsReducer = (state = {}, action) => {
    Object.freeze(state);
    const newState = { ...state };
    
    switch(action.type) {
        case RECEIVE_PRODUCTS:
            return { ...action.products };
        case RECEIVE_PRODUCT:
            return { ...action.payload };
        case RECEIVE_FEATURED_PRODUCT:
            return { ...newState, ...action.payload };
        case REMOVE_PRODUCTS:
            return {};
        default:
            return state;
    }
}

export default productsReducer;