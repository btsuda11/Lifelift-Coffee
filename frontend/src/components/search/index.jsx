import { CiSearch } from 'react-icons/ci';
import './SearchPage.css';
import { Link } from 'react-router-dom';
import { useState } from 'react';

const SearchPage = ({ closeCart }) => {
    const [query, setQuery] = useState('');

    return (
        <>
            <section className='search-section' onClick={closeCart}>
                <h2>Search Results</h2>
                <div className='search-bar'>
                    <input type='text' placeholder='Search Terms' value={query} onChange={e => setQuery(e.target.value)} />
                    <Link to={{pathname: '/search-results', state: {query}}}><CiSearch /></Link>
                </div>
            </section>
        </>
    )
}

export default SearchPage;