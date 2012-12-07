class FontsController < ApplicationController
  
  def index
    @fonts = Font.page(params[:page]).per(50)
    @current_user = current_user
    @user_fonts = @current_user.fonts
    logger.info("font ids"<<@current_user.font_ids.inspect)
    logger.info("THEid"<<@current_user.id)
    logger.info(@fonts.first)
    respond_to do |format|
          format.html
          format.json  { render :json => Font.all }
    end
  end
  
  def new
    @font = Font.new
  end

  def show
    respond_to do |format|
          format.html
          format.json  { render :json => Font.find(params[:id]) }
    end
  end

  def create
    respond_to do |format|
          format.json  { render :json => Font.create(params[:font]) }
    end
  end
  
  def edit
    Font.find(params[:id])
  end

  def update
    respond_to do |format|
          format.html
          format.json  { render :json => Font.update(params[:id], params[:font]) }
    end
  end

  def destroy
    respond_to do |format|
          format.html
          format.json  { render :json => Font.destroy(params[:id]) }
    end
  end
  
end