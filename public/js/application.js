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

  $('best_answer_form').submit(function(event) {
    event.preventDefault();

  $.ajax({
    method: 'put',
    url: $(event.target).attr('action')
  })
    .done(function(response){

    });



  })

});
