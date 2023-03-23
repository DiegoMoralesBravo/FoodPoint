function addEvent() {
  const items = document.querySelectorAll(".card");
  const listItems = document.querySelector(".list");
  const totalItems = document.querySelector(".total-items");
  const totalPrice = document.querySelector(".total-price");
  const cancelButton = document.querySelector(".cancel-order");
  const notes = document.querySelector(".note-order");
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const csrfParam = document.querySelector('meta[name="csrf-param"]').getAttribute('content');
  const modal = document.getElementById("myModal"); // Obtener el modal
  const cards = document.querySelectorAll('.cards'); // Script que ayuda a selecionar la mesa
  const sendButton = document.querySelector(".send-to-kitchen"); // Obtener el botón que abre el modal
  const span = document.getElementsByClassName("close")[0]; // Obtener el botón de cierre

  notes.value = '';

  let button;
  let sumItems = 0;
  let sumPrice = 0;
  let newOrder = []

  for (let i = 0; i < items.length; i++) {
    button = items[i].querySelector(".button-add");

    button.onclick = function () {
      let item = {}
      const name = items[i].childNodes[3].childNodes[1].innerText;
      const category = items[i].querySelector(".icon_category").src
      const price = items[i].querySelector(".price").innerText;

      sumPrice += parseInt(price);
      sumItems += 1;
      totalItems.innerText = sumItems;
      totalPrice.innerText = sumPrice;

      const listItem = document.createElement("li");
      const divIcon = document.createElement("div");
      const imgItem = document.createElement("img");
      const nameItem = document.createElement("p");
      const divPrice = document.createElement("div");
      const deleteButton = document.createElement('button');
      const deleteImg = document.createElement('img');
      const priceItem = document.createElement("p");

      listItem.className = 'item'
      divIcon.className = 'list-icon'
      divPrice.className = 'list-price'

      imgItem.src = category;

      deleteImg.src = '/assets/delete_white_24dp.svg';
      deleteButton.append(deleteImg);


      nameItem.textContent = name;
      priceItem.textContent = '$' + price;

      divPrice.append(priceItem, deleteButton);
      divIcon.append(imgItem, nameItem);

      listItem.append(divIcon, divPrice);

      listItems.append(listItem);

      item = {
        name,
        quantity: 1
      }

      newOrder = itemCheck(item, newOrder, 'add')

      deleteButton.onclick = () => {
        sumPrice -= price;
        sumItems -= 1;
        totalItems.innerText = sumItems;
        totalPrice.innerText = sumPrice;
        listItem.remove()
        newOrder = itemCheck(item, newOrder, 'delete')
      }
    }
  }

  cancelButton.onclick = function () {
    totalItems.innerText = 0;
    totalPrice.innerText = 0;
    listItems.innerHTML = '';
    newOrder = [];
    notes.value = '';
  }

  sendButton.onclick = function () {

    modal.style.display = "block";
  }

  cards.forEach(card => {
    card.addEventListener('click', () => {
      const mesaId = card.dataset.mesaId;
      const status = card.classList.contains('cards-green') ? 'progress' : card.classList.contains('cards-red') ? 'done' : 'wait';
      if (status === 'progress' || status === 'done') {
        alert('No puedes seleccionar esta mesa porque ya está en progreso o finalizada.');
      } else {
        let note = notes.value;
        fetch('/orders', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            [csrfParam]: csrfToken
          },
          body: JSON.stringify({ order: newOrder, total: sumPrice, note: note, selected_table_id: mesaId })
        })
        totalItems.innerText = 0;
        totalPrice.innerText = 0;
        listItems.innerHTML = '';
        newOrder = [];
        notes.value = '';
        modal.style.display = "none";
        alert("New order created for table " + mesaId);
      }
    });
  });

  // Cuando se hace clic en el botón de cierre o fuera del modal, cerrarlo
  span.onclick = function () {
    modal.style.display = "none";
  }

  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}

function itemCheck(item, order, mode) {
  let i;
  let flag = false;
  for (i = 0; i < order.length; i++) {
    if (order[i].name === item.name) {
      item = order[i]
      flag = true;
      break;
    }
  }

  if (flag) {
    if (mode === 'add') {
      item.quantity += 1;
    }
    if (mode === 'delete') {
      item.quantity -= 1;
      if (item.quantity === 0) {
        order = order.splice(i, i);
      }
    }
  } else {
    if (mode === 'add') {
      order.push(item);
    }
  }
  return order
}

addEvent();
