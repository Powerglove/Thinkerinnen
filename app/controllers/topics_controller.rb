class TopicsController < ApplicationController
  def index
  	@thinkers = Thinker.tagged_with(params[:topic]).all
  	@topic = params[:topic]
  end
end
