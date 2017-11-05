class P3sController < ApplicationController
  before_action :authenticate_user!

  def index
    @p3s = P3.all
    respond_to do |format|
    format.html
    format.js
   end

  end

  def new
  	@p3 = P3.new
  end

  def create
  	@p3 = P3.create(p3s_params)
    @p3.user_id = current_user.id
    # user_idを代入する
    if @p3.save
     redirect_to p3s_path, notice: "投稿しました"
   else
    render 'new'
   end
  end

  def edit
     @p3 = P3.find(params[:id])
  end

  def update
  	@p3 = P3.find(params[:id])
    @p3.update(p3s_params)
    # @pic.update(pictures_params)
    redirect_to p3s_path, notice: "編集しました"
  end

  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
   # binding.pry
    @comment = @p3.comments.build(set_p3)
    @comments = @p3.comments

  end


  def destroy
    @p3 = P3.find(params[:id])
    @p3.destroy
    redirect_to p3s_path, notice: "削除しました"	
  end

  private
   def p3s_params
    params.require(:p3).permit(:picture, :content)
  end

  def set_p3
    @p3 = P3.find(params[:id])
  end

end

