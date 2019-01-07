class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    respond_to do |format|
      if @task.save
        @tasks = Task.all.order("priority DESC")
        format.json { head }
        format.js
      else
        format.json { render json: @task.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
    #code
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.json { head }
        format.js
      else
        format.json { render json: @task.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def set_done
    @task = Task.find params[:id]
    respond_to do |format|
      if @task.done == true
        @task.update_attributes(:done => false)
        format.html { redirect_to tasks_url }
        format.json { head :no_content }
        format.js
        @message = "false"
      else
        @task.update_attributes(:done => true)
        format.html { redirect_to tasks_url }
        format.json { hehead :no_contentad }
        format.js
        @message = "true"
      end
    end
  end

  private
  def set_task
  	@task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :priority, :date_expense, :done)
  end

end
