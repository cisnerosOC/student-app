class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
    @address = @student.addresses.build
  end
  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:success] = t("added")
      redirect_to students_path 
    else
      render "new"
    end
  end


  def edit
    @student = Student.find_by(:id => params[:id])
  end

  def update
    @student = Student.find_by(:id => params[:id])

    if @student.update(student_params)
      flash[:success] = t("update")
      redirect_to students_path 
    else
      render "edit"
    end

  end
private
  def student_params
   params.require(:student).permit(:first_name, :last_name, addresses_attributes:[:student_id,:address1, :address2])  
  end
end