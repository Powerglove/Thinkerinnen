class ThinkersController < ApplicationController
  def new
  	@thinker = Thinker.new
  end

  def create
  	
  end

  def index
  	@thinkers = Thinker.all
  end

  def show
  	@thinker = Thinker.find(params[:id])
  end

  

  def destroy
  end
end
