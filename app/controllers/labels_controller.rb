class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to tasks_path
      flash[:success] = "Label「#{@label.label_name}」has been created"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def label_params
    params.require(:label).permit(:label_name,)
  end
  
  def set_label
    @label = Label.find(params[:id])
  end
end
