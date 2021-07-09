window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNumber = document.getElementById("profit");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  addTaxDom.innerHTML = inputValue * 0.1
  console.log(addTaxDom);

  profitNumber.innerHTML =  inputValue * 0.9
  console.log(profitNumber);

})
console.log(priceInput);
});

