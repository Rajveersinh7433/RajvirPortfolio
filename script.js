document.getElementById('theme-toggle').addEventListener('click', () => {
  document.body.classList.toggle('dark');
});

document.getElementById('contact-form').addEventListener('submit', (e) => {
  e.preventDefault();
  alert('Thanks for reaching out! I will get back to you soon.');
});
