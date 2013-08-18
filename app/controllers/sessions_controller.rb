class SessionsController < ApplicationController

  skip_before_action :signed_in_user, only: [:create, :new]

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to patients_path
    else
      flash.now[:error] = 'Invalid email and/or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def new
    redirect_to patients_path if signed_in?
  end

end
