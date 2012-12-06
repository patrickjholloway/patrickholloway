class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(user)
          styles_path
  end
end
