class TeeBoxSelect
  constructor: (@el) ->
    @teeBoxes = @el.data('values')
    $("##{@el.data('courseElmId')}").change (el) =>
      target = el.target
      @updateTeeBoxes($(@el), $(target).val())

  updateTeeBoxes: (selectElm, courseId)->
    selectElm.html('')
    selectElm.append("<option value=''>New Tee Box</option>")
    @addOption(selectElm, teeBox) for teeBox in @teeBoxes[courseId]

  addOption: (selectElm, teeBox) ->
    selectElm.append("<option value=#{teeBox.id}>#{teeBox.name}</option>")

$(document).on "page:change", ->
  return unless $("*[data-behavior='teeBoxSelect']").length > 0
  $("*[data-behavior='teeBoxSelect']").each (i, el) ->
    new TeeBoxSelect($(el))
