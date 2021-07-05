$(function () {
  $("#form-rating li").on("click", function () {
    let onStar = parseInt($(this).data("value"), 10);
    $("#form-rating li.star").each(function (i) {
      $(this).css("color", "#ccc");
      if (i < onStar) {
        $(this).css("color", "#FF912C");
        console.log(onStar);
      }
    });
    console.log(onStar);
    $("#rating").val(onStar);
  });
});
