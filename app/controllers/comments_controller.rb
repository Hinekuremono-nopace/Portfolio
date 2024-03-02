class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'コメントを追加しました。'
    else
      redirect_to @post, alert: 'コメントの追加に失敗しました。'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.user == current_user || @post.user == current_user
      @comment.destroy
      redirect_to @post, notice: 'コメントを削除しました。'
    else
      redirect_to @post, alert: 'コメントの削除に失敗しました。'
    end
  end  

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
