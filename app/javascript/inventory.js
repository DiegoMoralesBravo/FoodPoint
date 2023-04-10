function inventory() {
    const ingredients = document.querySelectorAll(".ingredient-inventory");
    for (let i = 0; i < ingredients.length; i++) {
        let ingredient = ingredients[i];
        button = ingredient.querySelector(".edit-inventory");
        button.onclick = function () {
            const totalContailer = ingredient.querySelector(".ingredient-total");
            const totalValue = ingredient.querySelector(".value-total");
            const input = document.createElement("input");
            const confirm = document.createElement("button");
            const cancel = document.createElement("button");

            input.setAttribute("type", "text");
            input.setAttribute("value", totalValue.innerText == 'Sin registro' ? 0 : totalValue.innerText);
            input.style.width = "20%"
            confirm.className = 'confirm-inv'
            cancel.className = 'cancel-inv'
            cancel.innerText = "X";
            confirm.innerText = "✔"

            totalContailer.replaceChild(input, totalValue);
            totalContailer.appendChild(confirm);
            totalContailer.appendChild(cancel);
        }
    }
}

inventory();
