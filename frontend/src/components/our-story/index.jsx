import './OurStoryPage.css';
import ritualImg from '../../assets/OurStoryPage/ritual-img.jpg';

const OurStoryPage = ({ closeCart }) => {
    return (
        <>
            <section onClick={closeCart} className='ritual-section'>
                <img src={ritualImg} />
                <div>
                    <h1>Our Story: "It's Ritual"</h1>
                    <h2>How we elevated coffee, health and your day</h2>
                    <p>We LOVE coffee. It's a ritual that starts your day off and brings you to that happy place of energy, productivity, focus, and emotional wellbeing.</p>
                    <p>If you want to feel your best, then why not feed your body the best source that you can find? That's why Lifelift Coffee was born.</p>
                </div>
            </section>
        </>
    )
}

export default OurStoryPage;