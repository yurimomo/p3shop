class P3sController < ApplicationController
  before_action :authenticate_user!
  before_action :set_p3, only: [:show, :edit, :update, :destroy]


  def index
    @p3s = P3.page(params[:page])
    @p3s = P3.all.order(created_at: :desc)
    # @search = P3.ransack(params[:q])
    @search = P3.ransack(params[:q])

    # 検索結果
    @products = @search.result

    respond_to do |format|
    format.html
    format.js

    # 検索オブジェクト
    # @search = P3.ransack(params[:q])
    # # 検索結果
    # @products = @search.result

   end
    # @q = P3.search(params[:q])
    # @product = @q.result(distinct: true)
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
  end

  def update
    @p3.update(p3s_params)
    # @pic.update(pictures_params)
    redirect_to p3s_path, notice: "編集しました"
  end

  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
   # binding.pry
    @comment = @p3.comments.build
    @comments = @p3.comments

  end


  def destroy
    @p3.destroy
    redirect_to p3s_path, notice: "削除しました"	
  end

  private
   def p3s_params
    params.require(:p3).permit(:picture, :content, :title, :price)
  end

  def set_p3
    @p3 = P3.find(params[:id])
  end


end
