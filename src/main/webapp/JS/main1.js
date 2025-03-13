/**
 * 
 */
const showMenu = (toggleId, navId) =>{
    	   const toggle = document.getElementById(toggleId),
           nav = document.getElementById(navId)

     toggle.addEventListener('click', () =>{
         nav.classList.toggle('show-menu')

         toggle.classList.toggle('show-icon')
     })
  }

  showMenu('nav-toggle','nav-menu')



  const menuBtn = document.querySelector('.nav__toggle');
  const navLinks = document.querySelector('.nav-links');

  menuBtn.addEventListener('click', () => {
      navLinks.style.display = navLinks.style.display === 'flex' ? 'none' : 'flex';
  });
  
  
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

