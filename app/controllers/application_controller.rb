class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(user)
    user.sign_in_count += 1
    if user.sign_in_count < 2
      welcome_path
    else  
      styles_path
    end
  end
end
