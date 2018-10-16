class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = params_to_create
    if @user.save
      sign_in @user
      redirect_to candidates_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def params_to_create
    @created_params = user_from_params
  end
end
