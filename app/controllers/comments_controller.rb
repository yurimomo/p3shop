class CommentsController < ApplicationController
    # コメントを保存、投稿するためのアクションです。
  def create
    # p3をパラメータの値から探し出し,p3に紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @p3 = @comment.p3
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to p3_path(@p3), notice: 'コメントを投稿しました。' }
        format.js { render :index }

      else
        format.html { render :new }
      end
    end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:p3_id, :content)
    end
end
