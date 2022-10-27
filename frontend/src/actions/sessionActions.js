import csrfFetch from "../store/csrf";

export const RECEIVE_USER = 'session/RECEIVE_USER';
export const REMOVE_USER = 'session/REMOVE_USER';

export const receiveCurrentUser = user => (
    { type: RECEIVE_USER, user }
)

export const removeCurrentUser = userId => (
    { type: REMOVE_USER, userId }
)

export const loginUser = user => async dispatch => {
    const response = await csrfFetch('/api/session', {
        method: 'POST',
        body: JSON.stringify(user)
    })

    const data = await response.json();
    dispatch(receiveCurrentUser(data.user));
    return data;
}