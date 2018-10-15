class Admin::AdminsController < ApplicationController
  
  http_basic_authenticate_with name: ENV["USERNAME"] , password: ENV["PASSWORD"]

  def authorize_admin
    super
  end

  def end_admin_session
    super
  end

  :authorize_admin

end
