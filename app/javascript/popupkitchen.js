$(document).ready(() => {
  $('#more-info').hide()
})

$(document).ready(() => {
  $("#btn-more-info").click(() => {
    $("#more-info").show();
  });
})

$(document).ready(() => {
  $("#btn-more-info-close").click(() => {
    $("#more-info").hide();
  });
})
