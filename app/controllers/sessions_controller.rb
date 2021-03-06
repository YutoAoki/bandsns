class SessionsController < ApplicationController
  before_action :forbid_login_user,{only: [:new, :create]}

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user_path(user.id), alert: 'ログインに成功しました！'

    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end


  def destroy
    log_out
    redirect_to root_path, alert: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def forbid_login_user
    if current_user != nil

      redirect_to user_path(current_user.id)
    end
  end



end
