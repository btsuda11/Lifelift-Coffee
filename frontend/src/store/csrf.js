export const restoreSession = async () => {
    const response = await csrfFetch('/api/session');
    storeCSRFToken(response);
    return response;
}

const storeCSRFToken = response => {
    const csrfToken = response.headers.get('X-CSRF-Token');
    if (csrfToken) sessionStorage.setItem('X-CSRF-Token', csrfToken);
}

export const csrfFetch = async (url, options = {}) => {
    options.method ||= 'GET';
    options.headers ||= {};

    // if using formData, need to exclude Content-Type header
    if (options.method.toUpperCase() !== 'GET') {
        options.headers['Content-Type'] = 'application/json';
        options.headers['X-CSRF-Token'] = sessionStorage.getItem('X-CSRF-Token');
    }

    const response = await fetch(url, options);

    if (response.status >= 400) throw response;

    return response;
}

export default csrfFetch;