class StylesController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    @styles = Style.page(params[:page]).per(50)
    respond_to do |format|
          format.html
          format.json  { render :json => Style.all }
    end
  end
  
  def new
    @style = Style.new
    @user = current_user
    logger.info("CURRENT USSSSEERRRR")
    logger.info(current_user)
    @user_fonts = @user.fonts
  end

  def show
    respond_to do |format|
          format.html
          format.json  { render :json => Style.find(params[:id]) }
    end
  end

  def create
    respond_to do |format|
          format.json  { render :json => Style.create(params[:style]) }
    end
  end
  
  def edit
    Style.find(params[:id])
  end

  def update
    respond_to do |format|
          format.html
          format.json  { render :json => Style.update(params[:id], params[:style]) }
    end
  end

  def destroy
    respond_to do |format|
          format.html
          format.json  { render :json => Style.destroy(params[:id]) }
    end
  end

end
