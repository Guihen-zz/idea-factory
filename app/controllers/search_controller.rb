class SearchController < ApplicationController
  def idea
  	@query = params[:q]
  	
  	@ideas = []
  	if @query == ""
  		redirect_to :back
  	else
  		@ideas = Idea.where('name LIKE ? OR description LIKE ?', "%#{@query}%", "%#{@query}%")	
  	end
  end

  def project
  end
end
