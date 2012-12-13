class PagesController < ApplicationController
  
  def home
    @active = 'home' # for bootstrap tab navbar
  end
  
  def about
    @active = 'about' # for bootstrap tab navbar
  end
  
  def resume
    @active = 'resume' # for bootstrap tab navbar
  end
  
  def welcome
    layout "demo"
  end
  
end
