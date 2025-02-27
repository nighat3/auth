class TasksController < ApplicationController
  def index
    if session["user_id"] != nil
      @tasks = Task.all
    else 
      redirect_to "/login"
    end
  end

  def create
    @task = Task.new
    @task["description"] = params["description"]
    @task["user_id"] = session["user_id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    
    if @task["user_id"] == session["user_id"]
    @task.destroy
    end
    
    redirect_to "/tasks"
  end
end
