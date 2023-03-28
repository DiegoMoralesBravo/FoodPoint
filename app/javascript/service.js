function service() {
  const items = document.querySelectorAll(".card");
  let listItems = document.querySelector(".list");
  let totalItems = document.querySelector(".total-items");
  let totalPrice = document.querySelector(".total-price");
  const cancelButton = document.querySelector(".cancel-order");
  const notes = document.querySelector(".note-order");
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const csrfParam = document.querySelector('meta[name="csrf-param"]').getAttribute('content');
  const modal = document.getElementById("myModal"); // Obtener el modal
  const cards = document.querySelectorAll('.cards'); // Script que ayuda a selecionar la mesa
  const sendButton = document.querySelector(".send-to-kitchen"); // Obtener el botón que abre el modal
  const span = document.getElementsByClassName("close")[0]; // Obtener el botón de cierre
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
    clear();
  }

  sendButton.onclick = function () {
    let params = URLValues();
    let numberOrder = null
    const data = {
      order: newOrder,
      total: sumPrice,
      note: notes.value,
      selected_table_id,
      numberOrder,
    }

    if (params.hasOwnProperty('order')) {
      data.numberOrder = params.order
      sendKitchen(data);
      clear();
      alert("Items added to order " + data.numberOrder);
      window.history.replaceState({}, document.title, "/orders");
      window.location.reload()
    } else {
      modal.style.display = "block";
    }
  }

  cards.forEach(card => {
    card.addEventListener('click', () => {
      const mesaId = card.dataset.mesaId;
      const status = card.classList.contains('cards-green') ? 'progress' : card.classList.contains('cards-red') ? 'done' : 'wait';
      const data = {
        order: newOrder,
        total: sumPrice,
        note: notes.value,
        selected_table_id,
        numberOrder: null,
      }
      if (status === 'progress' || status === 'done') {
        alert('No puedes seleccionar esta mesa porque ya está en progreso o finalizada.');
      } else {
        data.selected_table_id = mesaId;
        sendKitchen(data);
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

  function URLValues() {
    let queryString = window.location.search;
    let queryParams = {};
    queryString = queryString.substring(1);
    let queryArray = queryString.split("&");

    for (let i = 0; i < queryArray.length; i++) {
      let queryPair = queryArray[i].split("=");
      queryParams[decodeURIComponent(queryPair[0])] = decodeURIComponent(queryPair[1] || "");
    }
    return queryParams
  }

  function clear() {
    totalItems.innerText = 0;
    totalPrice.innerText = 0;
    listItems.innerHTML = '';
    newOrder = [];
    notes.value = '';
    modal.style.display = "none";
  }

  function sendKitchen(data) {
    fetch('/orders', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        [csrfParam]: csrfToken
      },
      body: JSON.stringify(data)
    })
    clear();
  }
}

service();
