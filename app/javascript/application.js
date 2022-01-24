// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs
//= require jquery.validate
import "@hotwired/turbo-rails"
import "controllers"

$(document).on ('click', '.add_questions', function(event) {
  var time, regexp;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');

  $('.question_fields').append($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});

$(document).on ('click', '.add_answers', function(event) {
  var time, regexp;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');

  $('.answer_fields').append($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});

$(document).ready(function() {
  $('#question_form').validate({
    focusInvalid: false,
    errorClass: 'alert alert-warning',
    errorElement: "div",
    errorPlacement: function(error, element) { $('#question_form').before(error); },
    rules: {
      'question_form[id]': {
        required: true
      }
    },
    messages: {
      'question_form[id]': {
        required: "Please select one of the questions."
      }
    }
  });
});
