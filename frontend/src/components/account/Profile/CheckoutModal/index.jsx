import './CheckoutModal.css';
import { AiOutlineClose } from 'react-icons/ai';

const CheckoutModal = ({ setShowCheckoutModal }) => {
    return (
        <div className='checkout-modal'>
            <div onClick={() => setShowCheckoutModal(false)}>
                <AiOutlineClose />
            </div>
            <h3>Thank you for your purchase!</h3>
            <p className='narrow'>Hope you enjoyed this website! All products featured are real and can be purchased at www.lifeboostcoffee.com</p>
            <p className='bold'>Connect with me at my links down below!</p>
        </div>
    )
}

export default CheckoutModal;