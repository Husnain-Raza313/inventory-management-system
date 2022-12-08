$(document).on("change", "#reports_dropdown", function () {
  alert("sdbfkjdsbfj,dsbn,fmnad,mn");
  var state = $(this).val();
  var request = $.ajax({
    url: "/reports",
    type: "get",
    data: { reports: state },
    dataType: "json",
  });
});
