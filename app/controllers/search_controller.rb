class SearchController < ApplicationController
  def idea
  	@query = params[:q]
  	
  	@ideas   = []
  	@my_ideas    = []
  	@other_ideas = []

  	if @query == ""
  		redirect_to :back
  	else
  		@ideas   = Idea.where('name LIKE ? OR description LIKE ?', "%#{@query}%", "%#{@query}%")
  		@my_ideas    = @ideas.where(user_id: current_user)
  		@other_ideas = @ideas - @my_ideas
  	end
  end

  def project
  end
end
