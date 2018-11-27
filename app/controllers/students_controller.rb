class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @s_show = Student.find(params[:id])
  end

  def activate
    @s_activate = Student.find(params[:id])
    if @s_activate.active
       @s_activate.active = false
    else
       @s_activate.active = true
    end
    @s_activate.save
    @s_show = @s_activate
    redirect_to student_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
