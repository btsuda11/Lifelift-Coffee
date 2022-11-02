import csrfFetch from "../store/csrf";

export const RECEIVE_CART_ITEM = 'items/RECEIVE_CART_ITEM';
export const RECEIVE_CART_ITEMS = 'items/RECEIVE_CART_ITEMS';
export const REMOVE_CART_ITEM = 'items/REMOVE_CART_ITEM';

const receiveCartItem = item => (
    { type: RECEIVE_CART_ITEM, item }
)

const receiveCartItems = items => (
    { type: RECEIVE_CART_ITEMS, items }
)

const removeCartItem = itemId => (
    { type: REMOVE_CART_ITEM, itemId }
)

export const fetchCartItems = () => async dispatch => {
    const response = await csrfFetch('/api/cart_items');
    if (response.ok) {
        const items = await response.json();
        dispatch(receiveCartItems(items));
    }
}

export const createCartItem = item => async dispatch => {
    const response = await csrfFetch('/api/cart_items', {
        method: 'POST',
        body: JSON.stringify(item)
    });
    if (response.ok) {
        const item = await response.json();
        dispatch(receiveCartItem(item));
    }
}

export const updateCartItem = item => async dispatch => {
    const response = await csrfFetch(`/api/cart_items/${item.id}`, {
        method: 'PATCH',
        body: JSON.stringify(item)
    })
    if (response.ok) {
        const item = await response.json();
        dispatch(receiveCartItem(item));
    }
}

export const deleteCartItem = itemId => async dispatch => {
    const response = await csrfFetch(`/api/cart_items/${itemId}`, {
        method: 'DELETE'
    })
    if (response.ok) {
        dispatch(removeCartItem(itemId));
    }
}