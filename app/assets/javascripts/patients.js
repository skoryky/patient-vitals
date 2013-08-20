$(document).on('page:load', function() {
  pollPatients()
})

$(function() {
  pollPatients()
})

function pollPatients() {
  clearTimeout(timer)
  if ($('#patients-table').length > 0) {
  	var timer = setTimeout(updatePatients, 2000)
  }
}

function updatePatients() {
  if ($("div#patient").length > 0) {
    var after = Math.max.apply(Math, $("div#patient").map(function() { return $(this).data("time") }));
    var after_vitals = Math.max.apply(Math, $("div#patient").map(function() { return $(this).data("time-vitals") }));
  } else {
	var after = 0;
	var after_vitals = 0;
  }

  $.getScript("/patients.js?after=" + after + "&after_vitals=" + after_vitals);
  pollPatients()
}