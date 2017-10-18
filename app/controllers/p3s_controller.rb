class P3sController < ApplicationController
  before_action :authenticate_user!

  def index
    @p3s = P3.all
  end

  def new
  	@p3 = P3.new
  end

  def create
  	P3.create(p3s_params)
    redirect_to p3s_path
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
