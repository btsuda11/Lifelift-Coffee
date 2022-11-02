import csrfFetch from "../store/csrf";

export const RECEIVE_PRODUCT = 'products/RECEIVE_PRODUCT';
export const RECEIVE_PRODUCTS = 'products/RECEIVE_PRODUCTS';

const receiveProduct = payload => (
    { type: RECEIVE_PRODUCT, payload }
)

const receiveProducts = products => (
    { type: RECEIVE_PRODUCTS, products }
)

export const getProducts = state => (
    state.entities.products ? Object.values(state.entities.products) : []
)

export const getProduct = productName => state => (
    state.entities.products[productName] ? state.entities.products[productName] : []
)

export const fetchProducts = (category) => async dispatch => {
    const response = await csrfFetch(`/api/products?category=${category}`);
    if (response.ok) {
        const products = await response.json();
        dispatch(receiveProducts(products));
    }
}

export const fetchProduct = productName => async dispatch => {
    const response = await csrfFetch(`/api/products/${productName}`);
    if (response.ok) {
        const product = await response.json();
        dispatch(receiveProduct(product));
    }
}