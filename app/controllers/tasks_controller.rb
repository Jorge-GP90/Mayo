class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    if params[:sort_expired]
      @tasks = current_user.tasks.select(:id, :task_name, :description, :expired_at, :status, :priority, :created_at,).order(expired_at: :DESC)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.select(:id, :task_name, :description, :expired_at, :status, :priority, :created_at,).order(priority: :DESC)
    else
      if params[:task].present?
        if params[:task][:task_name].present? && params[:task][:status].present?
          @tasks = current_user.tasks.search_task_name(params[:task][:task_name]).search_status(params[:task][:status]).order(created_at: :DESC)
        elsif params[:task][:task_name].present?
          @tasks = current_user.tasks.search_task_name(params[:task][:task_name]).order(created_at: :DESC)
        elsif params[:task][:status].present?
          @tasks = current_user.tasks.search_status(params[:task][:status])
        end
      else
        if params[:sort_expired].present?
          @tasks = current_user.tasks.select(:id, :task_name, :description, :expired_at, :status, :priority, :created_at,).order(expired_at: :DESC)
        else
          @tasks = current_user.tasks.select(:id, :task_name, :description, :expired_at, :status, :priority, :created_at,).order(created_at: :DESC)
        end
      end
    end
    @tasks = @tasks.page(params[:page]).per(3)
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task #{@task.task_name} was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task #{@task.task_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task #{@task.task_name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :description, :priority, :status, :expired_at)
  end
end
