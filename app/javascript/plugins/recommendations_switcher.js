export const showRecommendation = (movieIndex) => {
  console.log(movieIndex);

  // Remove active class to all posters and recommendation block
  const pictures = document.querySelectorAll(".recommendation__picture");
  const recommendations = document.querySelectorAll(".recommendation");
  pictures.forEach((picture) => {
    picture.classList.remove("active");
  });
  recommendations.forEach((recommendation) => {
    recommendation.classList.remove("active");
  });

  // Add `active` to the selected one
  const currentPicture = document.querySelector(
    `.recommendation__picture[data-movie-id="${movieIndex}"]`
  );
  const currentRecommendation = document.querySelector(
    `.recommendation[data-movie-id="${movieIndex}"]`
  );
  currentPicture.classList.add("active");
  currentRecommendation.classList.add("active");
};
