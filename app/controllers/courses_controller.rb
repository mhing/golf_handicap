class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @courses = Course.all
  end

  def show
  end
end
