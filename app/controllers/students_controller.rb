class StudentsController < ApplicationController
     #GET /students
    def index 
        render json: Student.all, status: :ok
    end

    #GET /students/:id
    def show
        student = find_student
        render json: student, status: :ok
    end

    #PATCH /students/:id
    def update
        student = find_student
        student.update(student_params)
        render json: student, status: :ok
    end

    #DELETE /students/:id
    def destroy 
        student = find_student
        student.destroy
        head :no_content
    end
    
    private
    
    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def find_student
        Student.find(params[:id])
    end

end


