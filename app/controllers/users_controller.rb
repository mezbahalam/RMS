class UsersController < Clearance::UsersController
  skip_before_action :check_if_email_confirmed
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      deliver_email(@user)
      sign_in (@user)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def deliver_email(user)
    ::UserMailer.sign_up_confirmation(user).deliver_now
  end
end
