
// Obtener el modal

var modal = document.getElementById("myModal");

// Obtener el botón que abre el modal
var btn = document.getElementById("myBtn");

// Obtener el botón de cierre
var span = document.getElementsByClassName("close")[0];

// Cuando se hace clic en el botón, abrir el modal
btn.onclick = function() {
  modal.style.display = "block";
}

// Cuando se hace clic en el botón de cierre o fuera del modal, cerrarlo
span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}