import { RECEIVE_CART_ITEM, RECEIVE_CART_ITEMS, REMOVE_CART_ITEM } from "../actions/cartItemActions";

const cartItemsReducer = (state = {}, action) => {
    Object.freeze(state);
    let newState = { ...state };

    switch(action.type) {
        case RECEIVE_CART_ITEMS:
            return { ...action.items };
        case RECEIVE_CART_ITEM:
            return { ...newState, [action.item.id]: action.item }
        case REMOVE_CART_ITEM:
            delete newState[action.itemId];
            return newState;
        default: 
            return state;
    }
}

export default cartItemsReducer;