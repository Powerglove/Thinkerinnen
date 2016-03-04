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

  def edit
  	@thinker = Thinker.find(params[:id])
	end

	def update
	  @thinker = Thinker.find(params[:id])
	 
	  if @thinker.update(thinker_params)
	    redirect_to @thinker
	  else
	    render 'edit'
	  end
	end

  def destroy
  	@thinker = Thinker.find(params[:id])
  	@thinker.destroy
 
  	redirect_to thinkers_path
  end

  private

  def thinker_params
      params.require(:thinker).permit(:name, :email)
    end
end
