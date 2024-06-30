const pay = () => {

const priceInput = document.getElementById("item-price");

// 販売手数料の割合（例: 10%）
const FEE_PERCENTAGE = 10;

// 入力が変わるたびに計算を行う
priceInput.addEventListener("input", () => {
 const inputValue = parseFloat(priceInput.value);

    if (isNaN(inputValue)) {
      // 入力が数値でない場合、手数料と利益を空にする
      document.getElementById("add-tax-price").innerHTML = "";
      document.getElementById("profit").innerHTML = "";
      return;
    }
      // 販売手数料を計算
       const fee = calculateFee(inputValue);
       // 販売利益を計算
       const profit = calculateProfit(inputValue, fee);
       // 結果を表示
       const addTaxDom = document.getElementById("add-tax-price");
       const profitDom = document.getElementById("profit");

        addTaxDom.innerHTML = Math.floor(fee);
        profitDom.innerHTML = Math.floor(profit);
});
 
// 販売手数料を計算する関数
function calculateFee(price) {
  return price * (FEE_PERCENTAGE / 100);
}

// 販売利益を計算する関数
function calculateProfit(price, fee) {
  return price - fee;
}

}
 
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
