$(document).ready(function() {

    $('.upvote-question').submit(function(event) {
      event.preventDefault();


      $.ajax({
        method: 'POST',
        url: $(event.target).attr('action')
      })
        .done(function (response) {
          $(event.target).next().text(response);
        });
    });

    $('.downvote-question').submit(function (event) {
      event.preventDefault();

      $.ajax({
        method: 'POST',
        url: $(event.target).attr('action')
      })
        .done(function(response) {
          $(event.target).prev().text(response);
        });
    });

    $('.upvote-answer').submit(function(event) {
      event.preventDefault();

      $.ajax({
        method: 'POST',
        url: $(event.target).attr('action')
      })
        .done(function (response) {
          // debugger;
          $(event.target).next().text(response);
        });
    });

    $('.downvote-answer').submit(function (event) {
      event.preventDefault();

      $.ajax({
        method: 'POST',
        url: $(event.target).attr('action')
      })
        .done(function (response) {

        })
    });


  $('.best_answer_form').on("submit", function(event) {
    console.log('hello')
    event.preventDefault();

  $.ajax({

    method: "PUT",
    url: $(event.target).attr('action')
  })
    .done(function(response){

      $(event.target).after(response)
      $('.best_answer_form').hide()

    });



  })

});
