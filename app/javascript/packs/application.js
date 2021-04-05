// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import "channels";

Rails.start();
Turbolinks.start();

import { initAutocomplete } from "../plugins/autocomplete";
import { showRecommendation } from "../plugins/recommendations_switcher";
import { initConfetti } from "../plugins/confetti";
import { initBiographyExpand } from "../plugins/biography_expand";
import { initFaceRecognitionForm } from "../plugins/face_recognition";

window.showRecommendation = showRecommendation;
window.initConfetti = initConfetti;

document.addEventListener("turbolinks:load", () => {
  console.log("LOAD");
  initAutocomplete();
  initBiographyExpand();
  initFaceRecognitionForm();
});

