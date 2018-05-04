class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.band_id = params[:band_id]
    if @favorite.save

      redirect_to bands_path
    else
      redirect_to band_path
    end
  end

end
