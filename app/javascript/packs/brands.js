$(document).on('change', '#image-file', function(){
  let fileInput = document.getElementById('image-file');
  let filePath = fileInput.value;
  let allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

  if(!allowedExtensions.exec(filePath)){
    const error = document.getElementById('error-msg');

    if(error.innerHTML === ""){
      const text = document.createTextNode('Please upload file having extensions .jpeg/.jpg/.png/.gif only.');
      error.appendChild(text);
    }
    fileInput.value = '';
  }
});
disableSubmit = function(id) {
  var elem1 = document.getElementById("btn"+id);
    var elem = document.getElementById(id);
    elem1.classList.remove("d-none");
    elem.classList.add("d-none");
}


