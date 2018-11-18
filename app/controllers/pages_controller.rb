class PagesController < ApplicationController

  def index
    if current_user.role == 'admin'
      redirect_to candidates_path
    else
      render :index
    end
  end

end
