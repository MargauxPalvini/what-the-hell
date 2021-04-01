import confetti from "canvas-confetti";

export const initConfetti = () => {
  console.log("CONFETOS");
  confetti({
    particleCount: 100,
    spread: 70,
    origin: { y: 0.6 },
  });
};

// connect() {
//   confetti({
//     particleCount: 100,
//     spread: 70,
//     origin: { y: 0.6 },
//   });
// }

// toggleCollapse() {
//   this.btnCollapseTarget.classList.toggle("active");
//   const text = this.element.nextElementSibling;
//   text.style.display === "block"
//     ? (text.style.display = "none")
//     : (text.style.display = "block");
// }
