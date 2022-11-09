import { CiSearch } from 'react-icons/ci';
import './SearchPage.css';

const SearchPage = ({ closeCart }) => {
    return (
        <>
            <section className='search-section' onClick={closeCart}>
                <h2>Search Results</h2>
                <form className='search-bar'>
                    <input type='text' placeholder='Search Terms'/>
                    <button><CiSearch /></button>
                </form>
            </section>
        </>
    )
}

export default SearchPage;