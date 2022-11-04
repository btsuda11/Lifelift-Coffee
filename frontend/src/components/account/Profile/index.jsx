import { useDispatch, useSelector } from "react-redux";
import { Link, Redirect } from "react-router-dom";
import { Modal } from '../../../context/Modal';
import { logOutUser } from "../../../actions/sessionActions";
import './Profile.css'
import CheckoutModal from "./CheckoutModal";

const Profile = ({ closeCart, showCheckoutModal, setShowCheckoutModal }) => {
    const dispatch = useDispatch();
    const currentUserId = useSelector(state => state.session.currentUser);
    const currentUser = useSelector(state => state.entities.users[currentUserId]);

    if (!currentUserId) return <Redirect to='/account/login' />;

    const handleLogOut = e => {
        e.preventDefault();
        dispatch(logOutUser(currentUserId));
    }

    return (
        <>
            {showCheckoutModal && 
                <Modal onClose={() => setShowCheckoutModal(false)}>
                    <CheckoutModal setShowCheckoutModal={setShowCheckoutModal} />
                </Modal>
            }
            <section onClick={closeCart}>
                <div>
                    <h3>{currentUser.firstName + ' ' + currentUser.lastName}</h3>
                    <Link className='underline-on-hover' to='#' onClick={handleLogOut}>Log Out</Link>
                </div>
            </section>
        </>
    )
}

export default Profile;