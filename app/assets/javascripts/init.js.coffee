window.App ||= {}

App.init = ->
  # initialize page agnostic ui components
  Waves.displayEffect()
  $("*[data-behavior='dropdown']").dropdown({constrainWidth: false})
  $("*[data-behavior='modal']").leanModal()
  $("*[data-behavior='tabs']").tabs()
  $("*[data-behavior='accordion']").collapsible()
  $("*[data-behavior='characterCounter']").characterCounter()
  $("*[data-behavior='tooltip']").tooltip({delay:30})
  $("input[data-behavior='currencyFormat']").autoNumeric("init",
    aSep: ',',
    aDec: '.'
  )
  $("input[data-behavior='wholeNumberFormat']").autoNumeric("init",
    vMin:"0",
    vMax:"999999999999"
  )

  $("*[data-behavior='loadonchange']").change ->
    window.location.href = this.value

  $.each $("input[data-behavior='searchFilter']"), (index,elm)->
    target = $(elm).data('targetselector')
    $(elm).searchFilter({targetSelector:target})

  #keep until we have better testing
  true


$(document).on "page:change", ->
  App.init()
