function planner() {
  let itemList = document.querySelectorAll(".items-row");
  let itemName = document.querySelector(".planner-item-name");


  console.log(itemList);

  itemList.forEach((item) => {
    let button = item.querySelector(".button-planner-edit");
    let name = item.querySelector(".items-planner-name").innerHTML;

    button.addEventListener("click", (e) => {
      console.log(name);

      itemName.innerHTML = name;
    });
  });
}

planner();
