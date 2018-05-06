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
    # ransack実装部分
    # https://qiita.com/halspring/items/00bf12f248052433b24a　参考にしたページ
    @search =Band.search(params[:q])
    @bands = @search.result
  end



  def show
    @band = Band.find_by(id: params[:id])
    @comment = Comment.new

    @comments = @band.comments

    # @comment_user = User.find_by(user_id: user_id)

  end



  def edit
    @band = Band.find_by(id: params[:id])

  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      redirect_to band_path

    else
      render :edit

    end
  end

  private
  def band_params
    params.require(:band).permit(:band_name, :band_bio, :band_categ, :band_img)
  end
end

# profile_params = params.require(:member).permit(:profile_images_attributes: [:image])
