
addEventListener('load', () => {
  const priceForm = document.getElementById("item-price");
  priceForm.addEventListener("input", () => {
    const formValue = priceForm.value;

  const priceTax = document.getElementById("add-tax-price");
  priceTax.innerHTML = (Math.floor(formValue * 0.1));

  const priceProfit = document.getElementById("profit");
  priceProfit.innerHTML = (Math.floor(formValue - priceTax.innerHTML));

  })

});