function addEvent() {
  const items = document.querySelectorAll(".card");
  const listItems = document.querySelector(".list");
  const totalItems = document.querySelector(".total-items");
  const totalPrice = document.querySelector(".total-price");
  let button;
  let sumItems = 0;
  let sumPrice = 0;
  let newOrder = []
  
  for (let i = 0; i < items.length; i++) {
    button = items[i].querySelector(".button-add");

    button.onclick = function () {
      const name = items[i].childNodes[3].childNodes[1].innerText;
      const category = items[i].querySelector(".icon_category").src
      const price = items[i].querySelector(".price").innerText;

      sumPrice += parseInt(price);
      sumItems += 1;
      totalItems.innerText = sumItems;
      totalPrice.innerText =  sumPrice;

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

      deleteButton.onclick = () => {
        sumPrice -= price;
        sumItems -= 1;
        totalItems.innerText = sumItems;
        totalPrice.innerText =  sumPrice;
        listItem.remove()
      }
    };
  }
}

addEvent();
