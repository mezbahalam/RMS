class UsersController < Clearance::UsersController
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
    params.require(:user).permit(:email,
                                 :password,
                                 :firstname,
                                 :middlename,
                                 :lastname,
                                 :contact,
                                 :address,
                                 :dob,
                                 :country)
  end

  def deliver_email(user)
    ::UserMailer.sign_up_confirmation(user).deliver
  end
end
