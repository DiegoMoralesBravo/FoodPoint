document.addEventListener("DOMContentLoaded", function (event) {
  addEvent();
});

function addEvent() {
  const items = document.querySelectorAll(".card");
  const listItems = document.querySelector(".list");

  for (let i = 0; i < items.length; i++) {
    items[i].onclick = function () {
      const item = this;
      const name = item.childNodes[3].childNodes[1].innerText;
      const category = item.childNodes[5].childNodes[3].childNodes[1].childNodes[1].src
      const price = 200;

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
        listItem.remove()
      }
    };
  }
}
