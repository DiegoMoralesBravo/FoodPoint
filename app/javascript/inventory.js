function inventory() {
  const ingredients = document.querySelectorAll(".ingredient-inventory");
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const csrfParam = document.querySelector('meta[name="csrf-param"]').getAttribute('content');
  for (let i = 0; i < ingredients.length; i++) {
    let ingredient = ingredients[i];
    let btnConfirm = ingredient.querySelector('.confirm-button');
    let btnCancel = ingredient.querySelector('.cancel-button')
    let button = ingredient.querySelector(".delete-button");
    const totalContainer = ingredient.querySelector(".ingredient-total");
    const value = totalContainer.innerText;

    button.onclick = function () {
      const totalValue = ingredient.querySelector(".value-total");
      const input = document.createElement("input");

      input.setAttribute("type", "text");
      input.setAttribute("value", totalValue.innerText == 'Sin registro' ? 0 : totalValue.value);
      input.style.width = "40%"
      input.className = "input-total";

      totalContainer.replaceChild(input, totalValue);
      this.style.display = "none";
      btnCancel.style.display = "inline";
      btnConfirm.style.display = "inline";
    }

    btnCancel.onclick = function () {
      updateValue(ingredient, totalContainer, value)
      hideButtons(btnConfirm, btnCancel, button);
    }

    btnConfirm.onclick = function () {
      const idIngredient = ingredient.querySelector('.ingredient-id').innerText;
      const input = ingredient.querySelector(".input-total");
      const valueInput = input.value;

      updateValue(ingredient, totalContainer, valueInput)
      hideButtons(btnConfirm, btnCancel, button);
      sendInventory({ ingredient: idIngredient, total: valueInput });
    }

  }

  function hideButtons(btnConfirm, btnCancel, button) {
    btnConfirm.style.display = "none";
    btnCancel.style.display = "none";
    button.style.display = "block";
  }

  function updateValue(ingredient, totalContainer, value) {
    const input = ingredient.querySelector(".input-total");
    const span = document.createElement("span");

    span.className = "value-total";
    span.innerText = value;
    totalContainer.replaceChild(span, input);
  }
  function sendInventory(data) {
    fetch('/inventory', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        [csrfParam]: csrfToken
      },
      body: JSON.stringify(data)
    })
  }
}

inventory();
