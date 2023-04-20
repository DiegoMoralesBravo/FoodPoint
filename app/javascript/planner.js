function planner() {
  let itemList = document.querySelectorAll(".items-row");
  let itemName = document.querySelector(".planner-item-name");
  let itemCategory = document.querySelector(".planner-item-category");
  let itemPrice = document.querySelector(".planner-item-price");
  let itemDescription = document.querySelector(".item-info-description");
  let itemImage = document.querySelector(".item-planner-image-container");

  async function getIngredients(item_id, avg) {
    try {
      const response = await fetch(
        `/items_planner/getIngredients?item_id=${item_id}&avg=${avg}`
      );
      const data = await response.json();
      return data;
    } catch (error) {
      console.error(error);
    }
  }

  async function saveData() {
    try {
      const data = await getIngredients(id, avg);
      return data;
    } catch (error) {
      console.error(error);
    }
  }

  itemList.forEach((item) => {
    let button = item.querySelector(".button-planner-edit");
    let name = item.querySelector(".items-planner-name").innerText;
    let avg = item.querySelector(".items-planner-avg").innerText;
    let category = item.querySelector(".items-planner-category").innerHTML;
    let price = item.querySelector(".items-planner-price").innerHTML;
    let description = item.querySelector(
      ".items-planner-description"
    ).innerHTML;
    let image = item.querySelector(".items-planner-image").innerHTML;
    let id = item.querySelector(".items-planner-id").innerHTML;

    button.addEventListener("click", (e) => {
      itemName.innerHTML = name;
      itemCategory.innerHTML = category;
      itemPrice.innerHTML = price;
      itemDescription.innerHTML = description;
      itemImage.innerHTML = image;

      let itemRecipeContainer = document.querySelector(
        ".rows-ingredients-container"
      );

      itemRecipeContainer.innerHTML = " ";

      getIngredients(id, avg)
        .then((IngredientsList) => {
          let data = IngredientsList;

          data.forEach((element) => {
            console.log(element);

            let row = document.createElement("tr")

            row.classList.add("items-row-sidebar");
            let columnName = document.createElement("td");
            let columnNamQty = document.createElement("td");
            let columnAvailable = document.createElement("td");
            let columnStatus = document.createElement("td");



            columnName.innerHTML = element.name;
            columnNamQty.innerHTML = element.recipe_qty;
            columnAvailable.innerHTML = element.available
            columnStatus.innerHTML = element.status



            row.append(columnName);
            row.append(columnNamQty);
            row.append(columnAvailable);
            row.append(columnStatus);

            itemRecipeContainer.append(row);
          });
        })
        .catch((error) => {
          console.error(error);
        });
    });
  });
}

planner();
