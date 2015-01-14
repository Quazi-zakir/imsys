class StudentsController < ApplicationController
  #------------------------------------------------------------------------------------------------------
  expose(:students) {Student.all}
  expose(:student) {Student.new}
  expose(:new_student) {Student.new(student_params)}


  #------------------------------------------------------------------------------------------------------
  def index

  end
  #------------------------------------------------------------------------------------------------------
  def new
    # @section = Section.new
  end
  #------------------------------------------------------------------------------------------------------
  def create
    #@std=Student.new(student).save
    if new_student.save
      redirect_to students_path
    else
      render :new
    end

    #@section = Section.new(params[:section])
    # @section = Section.new(section_params)
    # if @section.save
    #   redirect_to sections_path :notice => "Section successfully saved."
    # else
    #   render "new"
    # end
  end
  #------------------------------------------------------------------------------------------------------
  def show
    #@section = Section.find(params[:id])
  end
  #------------------------------------------------------------------------------------------------------
  def edit
    #@section = Section.find(params[:id])

  end
  #------------------------------------------------------------------------------------------------------
  def update
    #@section = Section.find(params[:id])
    #if @section.update_attributes(params[:section])
    #if @user.update_attributes(section_params)if @team.update(team_params)

    if @section.update(section_params)
      redirect_to sections_path "Section successfully saved"
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  #------------------------------------------------------------------------------------------------------
  def student_params
    params.require(:student).permit(:student_name,:age,:gender)
  end


end
