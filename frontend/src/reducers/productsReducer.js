import { RECEIVE_PRODUCTS, RECEIVE_PRODUCT } from '../actions/productActions';

const productsReducer = (state = {}, action) => {
    Object.freeze(state);
    const newState = { ...state };
    
    switch(action.type) {
        case RECEIVE_PRODUCTS:
            return { ...newState, ...action.products };
        case RECEIVE_PRODUCT:
            return { ...newState, [action.payload.product.id]: action.payload.product };
        default:
            return state;
    }
}

export default productsReducer;