class RoundsController < ApplicationController
  def new
    @round = Round.new

    if new_round_params[:round][:course_id].present?
      @existing_courses = Course.all
      @course = Course.find new_round_params[:round][:course_id]
      @existing_tee_boxes = @course.tee_boxes
    else
      @course = Course.new
    end

    if new_round_params[:round][:tee_box_id].present?
      @tee_box = @course.tee_boxes.find(new_round_params[:round][:tee_box_id])
    else
      @tee_box = @course.tee_boxes.new
    end

    @round.course = @course
    @round.tee_box = @tee_box
  end

  def create
    @round = Round.create round_details_params
    redirect_to rounds_path
  end

  def edit
    @round = Round.find round_params
    @course = @round.course
    @tee_box = @round.tee_box
    @existing_courses = Course.all
  end

  def update
    round = Round.find(round_holes_params[:id])
    round.attributes = round_holes_params[:round]
    round.save!

    redirect_to round_path(round)
  end

  def destroy
  end

  def index
    @rounds = Round.all
    @existing_courses = Course.all
    @existing_tee_boxes = {}
    @existing_courses.each{|c| @existing_tee_boxes[c.id] = c.tee_boxes.select(:id, :name)}
  end

  def show
    @round = Round.find round_params
  end

  def add_holes
    @round = Round.find round_params
    unless @round.holes.present?
      Round::HOLES.times do |position|
        @round.holes.build(position: position + 1)
      end
    end
  end

  def add_hole_stats
    @round = Round.find round_params
    redirect_to action: "add_holes" unless @round.holes.present?
  end

  private

  def round_params
    params.require(:id)
  end

  def round_details_params
    params.require(:round).permit(:date_played, :score, :course_id, :tee_box_id,
                                  course_attributes: [:city, :name, :state],
                                  tee_box_attributes: [:name, :rating, :slope])
  end

  def round_holes_params
    params.permit(:id, round: [:tee_box, :date_played, :score, :rating, :slope, holes_attributes: [:id, :position, :yardage, :par, :handicap, :score, :putts, :fir, :gir, :sand_shots, :penalties]])
  end

  def new_round_params
    params.permit(round: [:course_id, :tee_box_id])
  end
end
