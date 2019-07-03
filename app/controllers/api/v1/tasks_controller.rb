class Api::V1::TasksController < ApplicationController
	before_action :authenticate_with_token!

	def index
	  	current_user.tasks
	  	render json: { tasks: tasks}, status: 200
	end

	def show
	  task = current_user.tasks.find(params[:id])
	  render jason: task, status: 200
	end

	def create
	  task => current_user.tasks.build(task_params)	

	  task.save

	  if task.save
	     render json: task, status: 201
	  else
	  	render jason: { errors: task.errors }, status: 422   
	  end
 	end

 		def update
 			task = current_user.tasks.find(params[:id])

 			if task.update_attributes(task_params)
 			render json: task, status: 200
 			else
 			  render json: { errors: task.errors }, status: 422
 		end


 	    def destroy
		  task = current_user.tasks.find(params[:id])
		  task.destroy
		  head 204		
     	end	


    private

    def task_params
      params.require(:task).permit(:title, :description, :deadline, :done)		
    end

end