class UsersController < ApplicationController

  before_action :admin_user, only: [:destroy, :index]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  skip_before_action :signed_in_user, only: [:create, :new]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to Patient Vitals!'
      redirect_to settings_path(id: @user)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Settings updated'
      redirect_to settings_path(id: @user)
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    flash[:success] = 'User was destroyed.'
    redirect_to users_url
  end

private

  def admin_user
    redirect_to(patients_path) unless current_user.admin?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end