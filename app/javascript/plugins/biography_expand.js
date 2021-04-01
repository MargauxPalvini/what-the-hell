const biography = document.querySelector(".final-actor__details");
const biographyButtons = document.querySelectorAll(
  ".final-actor__details .btn"
);

const switchBiographyClass = () => {
  biography.classList.toggle("closed");
};

const initBiographyExpand = () => {
  biographyButtons.forEach((button) => {
    button.addEventListener("click", switchBiographyClass);
  });
};

export { initBiographyExpand };
