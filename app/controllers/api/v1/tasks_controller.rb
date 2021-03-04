module Api
  module V1
    class TasksController < ApplicationController
      before_action :tasks_params, except:[:index]

      def index
        @tasks = Task.all
        return render json:{tasks: @tasks}
      end
    
      def create
        @task = Task.new(tasks_params)
        return valid_or_invalid(@task)
      end
    
      def show
        return render json:{task: tasks_params}
      end
    
      def update
        @task = Task.find(params[:id])
        @task.content = tasks_params
        return valid_or_invalid(@task)
      end
    
      def delete
        @task = Task.find(params[:id])
        @task.delete
        return render json:{result: "Deleted"}
      end
    
      private
      def tasks_params
        params.require(:task).permit(:content)
      end

      def valid_or_invalid(task)
        if task.valid?
          task.save
          return render json:{task: task}
        else
          return render json:{task: task.errors.full_messages}
        end
      end 
    end
    
  end
end
