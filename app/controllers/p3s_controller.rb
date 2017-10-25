class P3sController < ApplicationController
  before_action :authenticate_user!

  def index
    @p3s = P3.all
  end

  def new
  	@p3 = P3.new
  end

  def create
  	@pic = P3.create(p3s_params)
    @pic.user_id = current_user.id
    # user_idを代入する
    if @pic.save
     redirect_to p3s_path, notice: "投稿しました"
   else
    render 'new'
   end
  end

  def edit
  end

  def update
  	
  end

  def destroy
  	
  end

  private
   def p3s_params
    params.require(:p3).permit(:title, :content)
  end

end
