disableSubmit = function(id) {
  let btnId = document.getElementById("btn"+id);
  let elem = document.getElementById(id);
  btnId.classList.remove("d-none");
  elem.classList.add("d-none");
}
enableUpdate = function(id) {
  let btnId = document.getElementById("update-btn-"+id);
  btnId.removeAttribute("disabled","true");
}
