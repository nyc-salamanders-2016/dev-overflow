$(document).ready(function () {
  $(".tabs").children('li').click(function(e) {
      e.preventDefault();

      $(this).siblings().removeClass('active');
      $(this).addClass('active');
      var subject = $(this).children('a').attr('href');
      // debugger;
      // $('.tab-content').css('display');
      $(subject).show().css('block');
      $(subject).siblings().hide();
  });
});
