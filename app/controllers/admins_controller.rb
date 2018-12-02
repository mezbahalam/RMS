class AdminsController < ApplicationController
  authorize_resource class: AdminsController

  def index
    render :index
  end
end
