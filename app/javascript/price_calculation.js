
addEventListener('load', () => {
  const priceForm = document.getElementById("item-price");
  priceForm.addEventListener("input", () => {
    const formValue = priceForm.value;
    console.log(formValue);

  const priceTax = document.getElementById("add-tax-price");
  priceTax.innerHTML = (Math.floor(formValue * 0.1));
    console.log(priceTax);

  const priceProfit = document.getElementById("profit");
  priceProfit.innerHTML = (Math.floor(formValue - priceTax.innerHTML));
    console.log(priceProfit);

  })

});