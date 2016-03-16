class RoundsController < ApplicationController
  def new
    @round = Round.new
    @round.course ||= Course.new
    @existing_courses = Course.all
  end

  def create
    @round = Round.create round_params
    redirect_to rounds_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @rounds = Round.all
  end

  def show
  end

  private

  def round_params
    params.require(:round).permit(:date_played, :score, :rating, :slope, :course_id,
                                  course_attributes: [:city, :name, :state])
  end
end
