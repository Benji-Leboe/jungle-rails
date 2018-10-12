class ExampleSecureController < ApplicationController

  before_filter :authorize

  def secure_resource
  end

  def secure_action
  end
  
end
