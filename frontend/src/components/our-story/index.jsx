import './OurStoryPage.css';
import ritualImg from '../../assets/OurStoryPage/ritual-img.jpg';
import profilePic from '../../assets/OurStoryPage/profile-pic.JPG';

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
            <section onClick={closeCart} className='personal-section'>
                <div>
                    <h1>Spill the "Coffee"</h1>
                    <p>Thank you to <span className='bold'>Lifeboost Coffee</span> for inspiring this website clone! Funny enough, I'm not even an avid coffee drinker. I just started drinking coffee and Lifeboost Coffee was one of the first brands I stumbled upon. My name is Brendan Tsuda, a former chemist turned full-stack software engineer. I have experience with JavaScript, React, Redux, Ruby on Rails, and PostgreSQL. I am interested in developing and maintaining web applications that impact our daily lives. Hope you enjoyed browsing this website as much as I did creating it!</p>
                    <p className='bold'>- Brendan Tsuda</p>
                </div>
                <img src={profilePic} />
            </section>
        </>
    )
}

export default OurStoryPage;