class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.new(band_params)
    if @band.save

      redirect_to band_path(@band.id), notice: '登録完了'

    else
      flash.now[:alert] = '登録に失敗しました'
      render :new
    end
  end

  def index
    @bands = Band.all
    @search =Band.search(params[:q])
    @bands = @search.result
  end



  def show
    @band = Band.find_by(id: params[:id])

  end

  private
  def band_params
    params.require(:band).permit(:band_name, :band_bio, :band_categ, :band_img)
  end
end

# profile_params = params.require(:member).permit(:profile_images_attributes: [:image])
