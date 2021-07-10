window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNumber = document.getElementById("profit");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

  profitNumber.innerHTML =  Math.ceil(inputValue * 0.9)

})
});

