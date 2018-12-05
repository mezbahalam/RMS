class AdminsController < ApplicationController
  authorize_resource class: AdminsController

end
