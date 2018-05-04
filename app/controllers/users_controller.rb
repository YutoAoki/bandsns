class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
    @bands = current_user.bands
    # session=nilの為、current_userメソッドが走らない。
    # users.showに行く前にsession[:user_id]を取得する必要があるが、やり方不明。

  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
