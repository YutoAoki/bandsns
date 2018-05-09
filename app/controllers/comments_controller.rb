class CommentsController < ApplicationController


  def create
    @comment = current_user.comments.new(comment_params)

    @comment.band_id = params[:comment][:band_id]
    if @comment.save
      redirect_to band_path(id: @comment.band_id), notice: '登録完了'
    else
       flash.now[:alert] = '登録に失敗しました'
       redirect_to root_path
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:comment_text, :band_id, :user_id)
  end

end
