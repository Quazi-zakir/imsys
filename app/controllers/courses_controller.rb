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
    @course = Course.find(params[:id])
  end
  #------------------------------------------------------------------------------------------------------
  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to courses_path, :notice => "Course has been Updated"

    else
      render "edit"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_path, :notice=> "Your course has been deleted"
  end
  #------------------------------------------------------------------------------------------------------

  #------------------------------------------------------------------------------------------------------


end
