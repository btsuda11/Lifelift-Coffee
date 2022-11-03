import './SplashPage.css';
import { Link } from 'react-router-dom';
import toxin from '../../../images/Splash/toxin.svg';
import environment from '../../../images/Splash/environment.svg';
import shipping from '../../../images/Splash/shipping.svg';
import SpotlightSection from './SpotlightSection';

const SplashPage = ({ setShowCart, cartTotal, setCartTotal }) => {
    return (
        <>
            <section className='shop-section'>
                <div>
                    <h1>Helping You Achieve The Healthiest, Tastiest, Lowest Acid Cup of Coffee Possible</h1>
                    <h3>Using Sustainable Farming & Protecting Our Wildlife</h3>
                    <Link className='splash-shop-btn' to='/products'>Shop Lifelift</Link>
                </div>
            </section>
            <section className='deserve-section'>
                <div>
                    <h2>You Deserve The Best</h2>
                    <div className='info-div'>
                        <div>
                            <img src={toxin} />
                            <h4>3rd Party Tested For Mycotoxins, Heavy Metals & Over 400 Toxins!</h4>
                            <p>Our coffee is mold and chemical-free, non-GMO, shade grown, fairly traded, and single origin. We strive to give you the healthiest coffee on the planet!</p>
                        </div>
                        <div>
                            <img src={environment} />
                            <h4>Supporting People, Environment and Wildlife</h4>
                            <p>We pay our farmers a fair wage. They use sustainable farming which protects the environment and wildlife. We donate a percentage of profits to protect the plant and animals that live in our coffee regions.</p>
                        </div>
                        <div>
                            <img src={shipping} />
                            <h4>Free Shipping, Easy Returns, We Guarantee You'll Love It!</h4>
                            <p>We offer free shipping on all orders over $50, and we’re so confident you’ll love Lifelift Coffee that we guarantee your satisfaction. We will refund you if you’re unhappy (but you won’t be).</p>
                        </div>
                    </div>
                </div>
            </section>
            <SpotlightSection setShowCart={setShowCart} cartTotal={cartTotal} setCartTotal={setCartTotal} />
        </>
    )
}

export default SplashPage;