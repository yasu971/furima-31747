window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")

  priceInput.addEventListener('input', function(){
    const inputValue = priceInput.value
    console.log(inputValue)
    addTaxDom.innerHTML = Math.floor(inputValue / 10)
    Profit.innerHTML = Math.floor(inputValue * 0.9)
  })
})

