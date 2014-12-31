class CoursesController < ApplicationController
  #------------------------------------------------------------------------------------------------------
  def index
    @courses = Course.all
  end
  #------------------------------------------------------------------------------------------------------
  def new
    @course = Course.new
  end
  #------------------------------------------------------------------------------------------------------
  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to courses_path :notice => "Course successfully saved."
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def show
    @course = Course.find(params[:id])
  end
  #------------------------------------------------------------------------------------------------------
  def edit

  end
  #------------------------------------------------------------------------------------------------------
  def update

  end
  #------------------------------------------------------------------------------------------------------
  def destroy
  end
  #------------------------------------------------------------------------------------------------------

  #------------------------------------------------------------------------------------------------------


end