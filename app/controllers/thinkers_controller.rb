class ThinkersController < ApplicationController
  def new
  	@thinker = Thinker.new
  end

  def destroy
  end
end
