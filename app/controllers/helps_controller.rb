class HelpsController < ApplicationController
  authorize_resource class: HelpsController
  def show; end
end
