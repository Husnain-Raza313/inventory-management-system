enableUpdate = (id) => {
  $(`#update-btn-${id}`).removeAttr("disabled")
}

showHomeBtn = () => {
  $(`#home-pdf-btn`).removeClass("d-none")
}

disableSubmit = (id) => {
  $(`#order-msg-${id}`).removeClass("d-none");
  $(`#order-div-${id}`).addClass("d-none");
}
