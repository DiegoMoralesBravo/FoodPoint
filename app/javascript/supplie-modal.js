function main() {
  const modal = document.querySelector(".modal");
  const supplier = document.querySelector(".supplier-button");
  const closeButton = document.querySelector(".close")

  supplier.onclick = function () {
    modal.style.display = "block";
  }

  closeButton.onclick = function () {
    modal.style.display = "none";
  }

  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}

main();
