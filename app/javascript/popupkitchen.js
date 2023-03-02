const btnsMoreInfo = document.querySelectorAll('#btn-more-info');
const orderDetails = document.querySelectorAll('.order-details');

btnsMoreInfo.forEach(btn => {
  const orderId = btn.closest('.kitchen__order').getAttribute('id');
  const orderDetailsEl = document.querySelector(`#order-details-${orderId}`);

  btn.addEventListener('click', () => {
    orderDetailsEl.style.display = 'block';
  });

  orderDetailsEl.querySelector('.order-details__close-btn').addEventListener('click', () => {
    orderDetailsEl.style.display = 'none';
  });
});
