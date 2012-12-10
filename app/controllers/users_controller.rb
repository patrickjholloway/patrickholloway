class UsersController < ApplicationController
    
  def index
    @users = User.page(params[:page]).per(50)
    respond_to do |format|
          format.html
          format.json  { render :json => User.all }
    end
  end
  
  def new
    @user = User.new
  end

  def show
    respond_to do |format|
          format.html
          format.json  { render :json => User.find(params[:id]) }
    end
  end

  def create
    respond_to do |format|
          format.json  { render :json => User.create(params[:user]) }
    end
  end
  
  def edit
    User.find(params[:id])
  end
  
  def update
    respond_to do |format|
          format.html
          format.json  {
            render :json => User.where(id: params[:id]).update(font_ids: params[:user][:font_ids])
          }
    end
  end

  def destroy
    respond_to do |format|
          format.html
          format.json  { render :json => User.destroy(params[:id]) }
    end
  end
  
end