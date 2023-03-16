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

// Script que ayuda a selecionar la mesa
const cards = document.querySelectorAll('.cards');

cards.forEach(card => {
  card.addEventListener('click', () => {
    const mesaId = card.dataset.mesaId;
    const status = card.classList.contains('cards-green') ? 'progress' : card.classList.contains('cards-red') ? 'done' : 'wait';
    if (status === 'progress' || status === 'done') {
      alert('No puedes seleccionar esta mesa porque ya está en progreso o finalizada.');
    } else {
      const selectedTableId = document.querySelector('#selected_table_id');
      selectedTableId.value = mesaId;
      document.querySelector('form').submit();
    }
  });
});