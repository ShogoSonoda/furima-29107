window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const proFit = document.getElementById("profit");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    addTaxPrice.value = Math.floor(inputValue * 0.1)
    const addTaxPriceValue = addTaxPrice.value
    proFit.value = inputValue - addTaxPrice.value
    const proFitValue = proFit.value
    addTaxPrice.innerHTML = addTaxPriceValue
    proFit.innerHTML = proFitValue
  })
});