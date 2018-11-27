class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def activate_student
    @student = Student.find(params[:id])
    @student.active = !@student.active  
    @student.save
    
    # The below text also works!
    # is_active = @student.active 
    # @student.active = !is_active 

    redirect_to  student_path(@student)
    # byebug
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end