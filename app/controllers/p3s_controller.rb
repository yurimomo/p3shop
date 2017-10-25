class P3sController < ApplicationController
  before_action :authenticate_user!

  def index
    @p3s = P3.all
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

  def destroy
  	
  end

  private
   def p3s_params
    params.require(:p3).permit(:picture, :content)
  end

end

