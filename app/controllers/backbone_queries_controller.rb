class BackboneQueriesController < ApplicationController
  
  # Custom backbone queries that don't map to RESTful collection/model mirroring

  respond_to :json
  
  def crrnt_user
    respond_with current_user
  end

  def crrnt_user_fonts
    respond_with current_user.fonts
  end

end