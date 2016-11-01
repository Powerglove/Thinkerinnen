class TopicsController < ApplicationController
  def show
  	@thinkers = Thinker.tagged_with(params[:topic]).all
  	@topic = params[:topic]
  end
end
