function planner() {
  let itemList = document.querySelectorAll(".items-row");
  let itemName = document.querySelector(".planner-item-name");
  let itemCategory = document.querySelector(".planner-item-category");
  let itemPrice = document.querySelector(".planner-item-price");
  let itemDescription = document.querySelector(".item-info-description");
  let itemImage = document.querySelector(".item-planner-image-container");
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const csrfParam = document.querySelector('meta[name="csrf-param"]').getAttribute('content');

  async function getIngredients(item_id) {
    try {
      const response = await fetch(`/items_planner/getIngredients?item_id=${item_id}`);
      const data = await response.json();
      console.log(data); // Aquí puedes hacer algo con la lista de ingredientes
    } catch (error) {
      console.error(error);
    }
  }

  itemList.forEach((item) => {
    let button = item.querySelector(".button-planner-edit");
    let name = item.querySelector(".items-planner-name").innerText;
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
      getIngredients(id)
    });
  });
}

planner();
