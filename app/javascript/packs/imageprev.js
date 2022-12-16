const readURL = (input) => {
  if (input.files && input.files[0]) {
    let reader = new FileReader();
    reader.onload = (e) => $(".image-file").attr("src", e.target.result);
    reader.readAsDataURL(input.files[0]);
  }
};

$(document).on("change", ".image-file", function () {
  readURL(this);
});
