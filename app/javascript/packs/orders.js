enableUpdate = (id) => {
  $(`#update-btn-${id}`).removeAttr("disabled")
}
showHomeBtn = () => {
  $(`#home-pdf-btn`).removeClass("d-none")
}
