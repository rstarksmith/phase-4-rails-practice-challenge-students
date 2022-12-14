class InstructorsController < ApplicationController

    #GET /instructors
    def index 
        render json: Instructor.all, status: :ok
    end

    #GET /instructors/:id
    def show
        instructor = find_instructor
        render json: instructor, status: :ok
    end

    #PATCH /instructors/:id
    def update
        instructor = find_instructor
        instructor.update(:name)
        render json: instructor, status: :ok
    end

    #DELETE /instructors/:id
    def destroy 
        instructor = find_instructor
        instructor.destroy
        head :no_content
    end
    
    private

    def find_instructor
        Instructor.find(params[:id])
    end

end
