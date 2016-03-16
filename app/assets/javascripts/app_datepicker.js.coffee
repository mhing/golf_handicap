$(document).on "page:change", ->
  if $('.datepicker').length > 0
    $('.datepicker').pickadate
      selectMonths: true
      selectYears: 15
