class CoursesController < ApplicationController
  #------------------------------------------------------------------------------------------------------
  def index
    @courses = Course.all
  end
  #------------------------------------------------------------------------------------------------------
  def new
    @course = Course.new
    @sections = Section.all
    @course.sections.build

  end
  #------------------------------------------------------------------------------------------------------
  def create
    # @course = Course.new(params[:course])
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path :notice => "Course successfully saved."
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def show
    @course = Course.find(params[:id])
    @rec_course_section = CourseSection.find(params[:id])
    @un_assigned_sections = Section.all - @course.sections
#    raise @un_assigned_sections.inspect
    #@course_sections.joins(:pets).where("pets.name != ?", "fluffy")
    #User.joins(:pets).where("pets.name != ?", "fluffy")
    #raise @section = CourseSection.find_by_course_id(params[:id]).inspect
    #@section=@course.sections.build
    #@course_section = CourseSection.find_by_course_id(params[:id])

  end
  #------------------------------------------------------------------------------------------------------
  def edit
    @course = Course.find(params[:id])
  end
  #------------------------------------------------------------------------------------------------------
  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
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
  def add_course_section
    @course = Course.find(params[:cid])
    # raise Section.find(params[:sid]).inspect
    s = Section.find(params[:sid])
    cs = CourseSection.all.where(:course_id => @course.id, section_id: s.id).first_or_create
    #raise cs.inspect
    redirect_to @course, :notice=> "Your course and section now tagged"
  end
  #------------------------------------------------------------------------------------------------------
  def delete_couse_sctions
    course = Course.find(params[:cid])
    aa = CourseSection.find_by(course_id: params[:cid], section_id: params[:sid])
    if aa.present?
      aa.delete
    end
    # course_section = CourseSection.where(:course_id => @course.id, section_id: s.id)
    # course_section.destroy_all
    redirect_to course, :notice=> "Your course has been deleted"

  end
  #------------------------------------------------------------------------------------------------------
  def all_course_sections

  end
  #------------------------------------------------------------------------------------------------------
  def course_params
    params.require(:course).permit(:course_name, sections_attributes: [:section_name, :id])
  end
  #------------------------------------------------------------------------------------------------------

end
