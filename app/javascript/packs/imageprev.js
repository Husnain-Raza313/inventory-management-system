function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $(".image-file").attr("src", e.target.result);
    };

    reader.readAsDataURL(input.files[0]);
  }
}
$(document).on("change", ".image-file", function () {
  readURL(this);
});
