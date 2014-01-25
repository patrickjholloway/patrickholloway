class PagesController < ApplicationController
  layout "demo", only: "welcome"
  before_filter :authenticate_user!, only: "welcome"
  
  def home
    @active = 'home' # for bootstrap tab navbar
  end
  
  def about
    @active = 'about' # for bootstrap tab navbar
  end
  
  def resume
    redirect_to '/', notice: "I am not looking for a job!"
    #@active = 'resume' # for bootstrap tab navbar
  end

  def talks
  end

  def welcome
  end
  
end
