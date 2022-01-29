class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_admin
  skip_before_action :login_required
  
  def index
    @users = User.select(:id, :user_name, :email, :admin,).order(created_at: :DESC)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user)
      flash[:success] = "User「#{@user.user_name}」has been created"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    begin
      if @user.update(user_params)
        redirect_to admin_user_path(@user)
        flash[:info] = "User「#{@user.user_name}」has been edited"
      else
        render :edit
      end
    rescue RuntimeError
      redirect_to edit_admin_user_path(@user)
      flash[:warning] = "Only administer has privilege for editing"
    end
  end
  def destroy
    unless @user == current_user
          @user.destroy
          redirect_to admin_users_path
          flash[:danger] = "User「#{@user.user_name}」has been deleted"
    else
        redirect_to admin_users_path
        flash[:warning] = "This administer can no be delete it"
    end
  end
  private
  def user_params
    params.require(:user).permit(:user_name, :email, :admin, :password, :password_confirmation,)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def require_admin
    unless current_user.admin?
      redirect_to root_url
      # redirect_to new_session_path
      flash[:warning] = "Only administrator users can access"
    end
  end
end
