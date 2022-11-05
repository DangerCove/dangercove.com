document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }

  // Get all "navbar-burger" elements
  const $boxModals= Array.prototype.slice.call(document.querySelectorAll('.box-modal'), 0);

  // Check if there are any navbar burgers
  if ($boxModals.length > 0) {

    // Add a click event on each of them
    $boxModals.forEach( el => {
      const html = document.querySelector('html');
      const modal = el.querySelector('.modal');
      const background = el.querySelector('.modal-background');
      const closeButton = el.querySelector('.modal-close');
      const box = el.querySelector('.trigger');

      box.addEventListener('click', e => {
        html.classList.add('is-clipped');
        modal.classList.add('is-active');

        e.preventDefault()
      });

      const close = e => {
        html.classList.remove('is-clipped');
        modal.classList.remove('is-active');

        e.preventDefault()
      }

      background.addEventListener('click', close)
      closeButton.addEventListener('click', close)
    });
  }

});

hljs.initHighlightingOnLoad();
