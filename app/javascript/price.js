function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    tax = Math.floor(itemPrice.value * 0.1);
    saleProfit = itemPrice.value - tax
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    addTaxPrice.innerHTML = `${tax}`;
    profit.innerHTML = `${saleProfit}`
  });
};

window.addEventListener('load', price);