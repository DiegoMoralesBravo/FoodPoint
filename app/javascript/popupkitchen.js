$(document).ready(() => {
  $('.kitchen__order__info__button').click((event) => {
    const orderID = event.target.id.split('-')[3];
    $('#more-info-' + orderID).show();
  });
});

$(document).ready(() => {
  $('.kitchen__order__info__button__close').click((event) => {
    const orderID = event.target.id.split('-')[3];
    $('#more-info-' + orderID).hide();
  });
});
