function main() {
  const modal = document.querySelector(".modal");
  const recipeButton = document.querySelector(".recipe");
  const closeButton = document.querySelector(".close")
  const dishSpan = document.querySelector(".dish")
  const ingredients = document.querySelectorAll(".ingredient");
  const recipeTable = document.querySelector(".recipe-table");
  const alert = document.querySelector(".alert");
  const recipeTbody = document.querySelector(".recipe-tbody");
  const pricesRecipe = document.querySelector(".prices-recipe");
  const pricesTotal = document.querySelector(".prices-total");
  const suggestTotal = document.querySelector(".suggest-total");
  const buttonCreate = document.querySelector(".button-recipe");
  const form = document.querySelector('.form');
  const listIngredient = [];

  let dishName;
  let flagRecipeTable = false;

  recipeButton.onclick = function () {
    dishName = document.querySelector("#item_name").value;
    dishSpan.innerText = dishName;
    modal.style.display = "block";
  }

  closeButton.onclick = function () {
    modal.style.display = "none";
  }

  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }

  for (let i = 0; i < ingredients.length; i++) {
    const ingredient = {
      button: ingredients[i].querySelector(".add-button"),
      price: ingredients[i].querySelector(".price-ing").innerText,
      id: ingredients[i].querySelector(".id-ing").innerText,
      name: ingredients[i].querySelector(".name-ing").innerText,
      units: ingredients[i].querySelector(".units-ing").innerText
    }

    ingredient.button.onclick = function () {
      ingredients[i].style.display = "none";
      if (!flagRecipeTable) {
        flagRecipeTable = true;
        recipeTable.style.opacity = 1;
        alert.style.display = "none";
        pricesRecipe.style.display = "block";
      }
      recipeTbody.append(createRow(ingredient, ingredients[i]));
    }
  }

  function createRow(ingredient, ingredientRow) {
    const trIng = document.createElement("tr");
    const tdID = document.createElement("td");
    const tdName = document.createElement("td");
    const tdInput = document.createElement("td");
    const input = document.createElement("input");
    const units = document.createElement("span");
    const tdPrice = document.createElement("td");
    const tdsignSpan = document.createElement("span");
    const tdPriceSpan = document.createElement("span");
    const tdButton = document.createElement("td");
    const buttonRemove = document.createElement("button");

    trIng.className = 'value-ingredient'
    tdID.textContent = ingredient.id;
    tdID.className = 'id-ingredient'
    input.className = 'input-ingredient'
    tdName.textContent = ingredient.name;
    tdsignSpan.textContent = "$";
    tdPriceSpan.textContent = 0;

    tdPrice.append(tdsignSpan, tdPriceSpan);

    if (ingredient.units == "grams") {
      units.innerText = " gr";
    } else {
      units.innerText = " ml";
    }

    tdPriceSpan.className = 'price-ingredient'
    input.setAttribute("type", "number");
    tdInput.append(input, units);

    buttonRemove.className = 'remove-button'
    buttonRemove.innerText = "Remove"

    tdButton.append(buttonRemove);

    trIng.append(tdID, tdName, tdInput, tdPrice, tdButton)

    buttonRemove.onclick = () => {
      ingredientRow.style.display = null;
      trIng.remove();
      updatePrices();
    }

    input.onchange = () => {
      let total = ingredient.price * input.value
      tdPriceSpan.innerText = total.toFixed(2);
      updatePrices();
    }
    return trIng
  }

  function updatePrices() {
    const pricesIng = document.querySelectorAll(".price-ingredient");
    let totalPrice = 0;
    for (let i = 0; i < pricesIng.length; i++) {
      totalPrice += parseFloat(pricesIng[i].innerText);
    }
    pricesTotal.innerText = totalPrice.toFixed(2);
    suggestTotal.innerText = (totalPrice * 1.4).toFixed(2);
  }

  buttonCreate.onclick = () => {
    let ingredients = document.querySelectorAll('.value-ingredient');
    
    for (let i = 0; i < ingredients.length; i++) {
      const ingredient = ingredients[i];
      const id = ingredient.querySelector('.id-ingredient').innerText
      const value = ingredient.querySelector('.input-ingredient').value
      listIngredient.push({id, value})
    }

    form.elements['item[recipe]'].value = JSON.stringify(listIngredient);
    form.submit();
  }
}

main();
