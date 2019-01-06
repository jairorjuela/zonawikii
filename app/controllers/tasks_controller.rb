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
        @tasks = Task.all.order("priority ASC")
        format.json { head }
        format.js { flash[:notice] =  'Expense has been create successfully'}
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
        format.js { flash[:notice] =  'Expense has been create successfully'}
      else
        format.json { render json: @task.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
  def set_customer
  	@task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :priority, :date_expense, :done)
  end

end
