class TeachersController < ApplicationController
  #respond_to :html
  # expose(:teachers) {Teacher.all}

  # expose(:teacher) {Teacher.new}
  # expose(:teacher) { teacher.find(params[:id]) rescue Teacher.new }
  expose(:teachers)
  expose(:teacher) {Teacher.new}
  # expose(:teacher)
  expose(:new_teacher) {Teacher.new(teacher_params)}
  expose(:existing_teacher) { Teacher.find(params[:id]) }

  # expose(:teacher) #{ teacher.find(params[:id]) rescue Teacher.new(teacher_params) }
  # expose(:teacher) {Teacher.new}
  # expose(:teacher) {Teacher.new(teacher_params)}


  #------------------------------------------------------------------------------------------------------

  #------------------------------------------------------------------------------------------------------
  def create
    new_teacher.save
    # respond_with(teacher)
    redirect_to teachers_path
  end
  #------------------------------------------------------------------------------------------------------
  def update
    if existing_teacher.update_attributes(teacher_params)
      redirect_to teachers_path "Teacher successfully Registered"
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def destroy
    existing_teacher.destroy
    redirect_to teachers_path
  end
  #------------------------------------------------------------------------------------------------------
  def show
    #@tcs = existing_teacher.course_sections
    @tcs = existing_teacher.teacher_course_sections
    #raise @unassigned_course_sections = (CourseSection.all - @tcs).inspect
    @unassigned_course_sections = unassigned_teachers_course_sections
  end
  #------------------------------------------------------------------------------------------------------

  #------------------------------------------------------------------------------------------------------

  def teacher_params
    params.require(:teacher).permit(:teacher_name,:age,:gender)
  end

  #------------------------------------------------------------------------------------------------------
  def unassigned_teachers_course_sections
    if existing_teacher.teacher_course_sections.count > 0
        CourseSection.where("id not IN (?)", existing_teacher.teacher_course_sections.map(&:course_section_id))
    else
      CourseSection.all
    end
  end

  #------------------------------------------------------------------------------------------------------
  def add_course_section
    @cs = CourseSection.find(params[:csid])
    # raise Section.find(params[:sid]).inspect
    t = Teacher.find(params[:tid])
    cs = TeacherCourseSection.all.where(:course_section_id => @cs.id, teacher_id: t.id).first_or_create  # prevent duplication and add new
    #raise cs.inspect
    redirect_to t, :notice=> "Your course and section now tagged"
  end

  #------------------------------------------------------------------------------------------------------
  def delete_coruse_sctions_ralation
    #course = Course.find(params[:cid])
    aa = TeacherCourseSection.find_by(id: params[:id])
    t = aa.teacher
    if aa.present?
      aa.delete
    end

    redirect_to t, :notice=> "Your course has been deleted"

  end
end

