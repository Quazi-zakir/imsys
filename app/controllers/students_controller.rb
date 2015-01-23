class StudentsController < ApplicationController
  #------------------------------------------------------------------------------------------------------
  expose(:students) {Student.all}
  expose(:student) {Student.new}
  expose(:new_student) {Student.new(student_params)}
  # expose(:existing_student) { student.find(params[:id]) rescue Student.new }
  expose(:existing_student) { Student.find(params[:id]) }
  # expose(:existing_student) { Student.find(student_params[:id]) }

  #------------------------------------------------------------------------------------------------------
  # def index
  #
  # end
  #------------------------------------------------------------------------------------------------------
  # def new
  #
  # end
  #------------------------------------------------------------------------------------------------------
  def create
    if new_student.save
      redirect_to students_path
    else
      render :new
    end

  end
  #------------------------------------------------------------------------------------------------------
  def show
    #raise @tcs = existing_student.courses.sections.inspect
    #raise @tcs = existing_student.student_course_sections.inspect
    @tcs = existing_student.student_course_sections
    @list_all_unasigned_course_sections= unassigned_student_course_sections
  end
  #------------------------------------------------------------------------------------------------------
  def update
    if existing_student.update_attributes(student_params)
      redirect_to students_path "Student successfully Registered"
    else
      render "new"
    end
  end
  #------------------------------------------------------------------------------------------------------
  def destroy
    existing_student.destroy
    redirect_to students_path
  end
  #------------------------------------------------------------------------------------------------------
  def student_params
    params.require(:student).permit(:student_name,:age,:gender)
  end
  #------------------------------------------------------------------------------------------------------
  def unassigned_student_course_sections
    if existing_student.student_course_sections.count > 0
      CourseSection.where("course_id not IN (?)", existing_student.student_course_sections.map(&:course_id))
    else
      CourseSection.all
    end
  end

  #------------------------------------------------------------------------------------------------------
  def relate_course_section
    c = Course.find(params[:cid])
    s = Section.find(params[:sid])
    # raise Section.find(params[:sid]).inspect
    t = Student.find(params[:stdid])

    cs = StudentCourseSection.all.where(:course_id => c.id,:section_id => s.id, student_id: t.id).first_or_create  # prevent duplication and add new
    #raise cs.inspect
    redirect_to t, :notice=> "Your Student, course and section mapped successfully"
  end
  #------------------------------------------------------------------------------------------------------
  def delete_coruse_sctions_ralation
    #course = Course.find(params[:cid])
    aa = StudentCourseSection.find_by(id: params[:id])
    std = aa.student
    if aa.present?
      aa.delete
    end
    #raise std = Student.find(id: stdid).inspect
   # raise std = Student.find(stdid).inspect # Need clarification from Talha Bhai
    # course_section = CourseSection.where(:course_id => @course.id, section_id: s.id)
    # course_section.destroy_all
    redirect_to std, :notice=> "Your course has been deleted"

  end


end
