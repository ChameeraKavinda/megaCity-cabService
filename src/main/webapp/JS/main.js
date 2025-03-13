/**
 * 
 */

/*=============== SHOW MENU ===============*/
const showMenu = (toggleId, navId) =>{
   const toggle = document.getElementById(toggleId),
         nav = document.getElementById(navId)

   toggle.addEventListener('click', () =>{
       // Add show-menu class to nav menu
       nav.classList.toggle('show-menu')

       // Add show-icon to show and hide the menu icon
       toggle.classList.toggle('show-icon')
   })
}

showMenu('nav-toggle','nav-menu')



const menuBtn = document.querySelector('.nav__toggle');
const navLinks = document.querySelector('.nav-links');

menuBtn.addEventListener('click', () => {
    navLinks.style.display = navLinks.style.display === 'flex' ? 'none' : 'flex';
});

// Hero Slider
let currentSlide = 0;
const slides = [
    {
        image: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1920',
        car: 'Kia RioZ',
        price: '$50'
    },
    {
        image: 'https://images.unsplash.com/photo-1555215695-3004980ad54e?auto=format&fit=crop&w=1920',
        car: 'BMW M4',
        price: '$150'
    },
    {
        image: 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&w=1920',
        car: 'Audi R8',
        price: '$200'
    }
];

function updateSlide() {
    const hero = document.querySelector('.hero');
    const carName = document.querySelector('.hero-content h1');
    const price = document.querySelector('.hero-content p');

    hero.style.backgroundImage = `linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), 
                                 url('${slides[currentSlide].image}')`;
    carName.innerHTML = `${slides[currentSlide].car}<span>Z</span>`;
    price.textContent = `FOR RENT ${slides[currentSlide].price} PER DAY`;
}

document.querySelector('.prev').addEventListener('click', () => {
    currentSlide = (currentSlide - 1 + slides.length) % slides.length;
    updateSlide();
});

document.querySelector('.next').addEventListener('click', () => {
    currentSlide = (currentSlide + 1) % slides.length;
    updateSlide();
});

// Auto slide
setInterval(() => {
    currentSlide = (currentSlide + 1) % slides.length;
    updateSlide();
}, 5000);



// Smooth Scroll for Navigation Links
document.querySelectorAll('nav a').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const targetId = this.getAttribute('href').substring(1);
        const targetElement = document.getElementById(targetId);
        if (targetElement) {
            targetElement.scrollIntoView({
                behavior: 'smooth'
            });
        }
    });
});




//section_container banner_container count animation
function animateCount(id, start, end, duration) {
    let element = document.getElementById(id);
    let range = end - start;
    let startTime = null;

    function animation(currentTime) {
        if (startTime === null) startTime = currentTime;
        let progress = currentTime - startTime;
        let value = Math.min(start + Math.floor((progress / duration) * range), end);
        element.innerHTML = value + 'K+';
        if (progress < duration) {
            requestAnimationFrame(animation);
        } else {
            element.innerHTML = end + 'K+';
        }
    }

    requestAnimationFrame(animation);
}

window.onload = function() {
    animateCount('count1', 0, 25, 12000);  // Count from 0 to 25 in 2 seconds
    animateCount('count2', 0, 350, 13000); // Count from 0 to 350 in 3 seconds
    animateCount('count3', 0, 600, 14000); // Count from 0 to 600 in 4 seconds
};



