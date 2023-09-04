document.addEventListener("DOMContentLoaded", function() {
    const cartLink = document.querySelector("a[href$='shop/cart']");
    const popup = document.getElementById("cart-popup");

    cartLink.addEventListener("click", function(event) {
        event.preventDefault();
        popup.classList.toggle("visible");
    });
});