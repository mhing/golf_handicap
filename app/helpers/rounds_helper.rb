module RoundsHelper
  def course_display(round)
    course = round.course

    content_tag :div do
      content_tag(:div, course.name) +
        content_tag(:div, course.location)
    end
  end
end
