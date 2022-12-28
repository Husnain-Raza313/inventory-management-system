$(document).on("turbolinks:load", function () {
  $("#brand_filter").on("change", () => {
    let state = $("#brand_filter").val();
    submitForm(state);
  });

  $("#category_filter").on("change", () => {
    let state = $("#category_filter").val();
    submitForm(state);
  });
});
const submitForm = (state) => {
  if (state == "") {
    return $("#search-form").submit();
  }
};
