function planner() {
  let itemList = document.querySelectorAll(".items-row");
  let itemName = document.querySelector(".planner-item-name");
  let itemCategory = document.querySelector(".planner-item-category");
  let itemPrice = document.querySelector(".planner-item-price");




  console.log(itemList);

  itemList.forEach((item) => {
    let button = item.querySelector(".button-planner-edit");
    let name = item.querySelector(".items-planner-name").innerHTML;
    let category = item.querySelector(".items-planner-category").innerHTML;
    let price = item.querySelector(".items-planner-price").innerHTML;

    console.log(price);


    button.addEventListener("click", (e) => {
      console.log(name);
      console.log(price);

      itemName.innerHTML = name;
      itemCategory.innerHTML = category;
      itemPrice.innerHTML = price;

    });
  });
}

planner();
