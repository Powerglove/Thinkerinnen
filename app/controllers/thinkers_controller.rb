class ThinkersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
  	@thinker = Thinker.new
  end

  def create
  	@thinker = Thinker.new(thinker_params)
	  if @thinker.save
      flash[:notice] = "Thinker was successfully created!"
	    redirect_to @thinker
	  else
	    render 'new'
	  end
  end

  def index
    @thinkers = Thinker.all.order(name: :asc)
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
      flash[:notice] = "Thinker successfully updated"
	    redirect_to @thinker
	  else
	    render 'edit'
	  end
	end

  def destroy
  	@thinker = Thinker.find(params[:id])
    authorize @thinker.destroy
    @thinker.destroy
    flash[:notice] = "You have successfully deleted #{@thinker.name}."
    redirect_to thinkers_path  
  end

  private

  def thinker_params
      params.require(:thinker).permit(:name, :email, :topic_list, :life_date_birth, :life_date_death, :reference)
    end
end
