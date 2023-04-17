function planner() {
  let itemList = document.querySelectorAll(".items-row");
  let itemName = document.querySelector(".planner-item-name");
  let itemCategory = document.querySelector(".planner-item-category");
  let itemPrice = document.querySelector(".planner-item-price");
  let itemDescription = document.querySelector(".item-info-description");
  let itemImage = document.querySelector(".item-planner-image-container");

  console.log(itemImage);

  itemList.forEach((item) => {
    let button = item.querySelector(".button-planner-edit");
    let name = item.querySelector(".items-planner-name").innerHTML;
    let category = item.querySelector(".items-planner-category").innerHTML;
    let price = item.querySelector(".items-planner-price").innerHTML;
    let description = item.querySelector(
      ".items-planner-description"
    ).innerHTML;
    let image = item.querySelector(".items-planner-image").innerHTML;

    button.addEventListener("click", (e) => {
      console.log(name);
      console.log(price);
      console.log(image);

      itemName.innerHTML = name;
      itemCategory.innerHTML = category;
      itemPrice.innerHTML = price;
      itemDescription.innerHTML = description;
      itemImage.innerHTML = image;
    });
  });
}

planner();
