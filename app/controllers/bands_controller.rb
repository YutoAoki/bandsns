class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.new(band_params)
    if @band.save
      redirect_to root_path, notice: '登録完了'
    else
      flash.now[:alert] = '登録に失敗しました'
      render :new
    end
  end

  private
  def band_params
    params.require(:band).permit(:band_name, :band_bio, :band_categ, :band_img)
  end
end
