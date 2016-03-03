class ThinkersController < ApplicationController
  def new
  	@thinker = Thinker.new
  end

  def create
  	@thinker = Thinker.new(thinker_params)
 
	  if @thinker.save
	    redirect_to @thinker
	  else
	    render 'new'
	  end
  end

  def index
  	@thinkers = Thinker.all
  end

  def show
  	@thinker = Thinker.find(params[:id])
  end

  

  def destroy
  end

  private

  def thinker_params
      params.require(:thinker).permit(:name, :email)
    end
end
