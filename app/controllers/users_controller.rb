class UsersController < Clearance::UsersController
  skip_before_action :check_if_profile_filled?, only: %i(edit update)

  def new
    @user = User.new
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = t('shared.all.user_success')
      redirect_to pages_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :first_name,
                                 :middle_name,
                                 :last_name,
                                 :role,
                                 :country)
  end

  def deliver_email(user)
    ::UserMailer.sign_up_confirmation(user).deliver
  end
end
