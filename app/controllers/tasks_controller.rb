class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index

    if params[:sort_expired]
      @tasks = Task.all.order("expired_at DESC").page(params[:page]).per(3) || 1
    elsif params[:sort_priority]
      @tasks = Task.all.order("priority DESC").page(params[:page]).per(3) || 1
    else
      if params[:task].present?
        if params[:task][:task_name].present? && params[:task][:status].present?
          @tasks = Task.search_task_name(params[:task][:task_name]).search_status(params[:task][:status]).page(params[:page]).per(3) || 1
        elsif params[:task][:task_name].present?
          @tasks = Task.search_task_name(params[:task][:task_name]).page(params[:page]).per(3) || 1
        elsif params[:task][:status].present?
          @tasks = Task.search_status(params[:task][:status]).page(params[:page]).per(3) || 1
        end
      else
        if params[:sort_expired].present?
          @tasks = Task.all.order("expired_at DESC").page(params[:page]).per(3) || 1
        else
          @tasks = Task.all.order("created_at DESC").page(params[:page]).per(3) || 1
        end
      end
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

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
