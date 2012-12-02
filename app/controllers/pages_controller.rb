class PagesController < ApplicationController
  
  def home
    @active = 'home'
  end
  
  def about
    @active = 'about'
  end
  
end
