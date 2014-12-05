class SearchController < ApplicationController
  def idea
  	@query = params[:q]

    @ideas       = []
    @my_ideas    = []
    @other_ideas = []

    @projects       = []
    @my_projects    = []
    @other_projects = []

    if @query == ""
      redirect_to :back
    else
      @ideas = Idea.where('name LIKE ? OR description LIKE ? OR platform LIKE ? or tools LIKE ?',
        "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%")
      @my_ideas    = @ideas.where(user_id: current_user)
      @other_ideas = @ideas - @my_ideas

      @projects       = Project.where('name LIKE ?', "%#{@query}%")
      @my_projects    = @projects.select {|p| p.users.map {|u| u.id}.include? current_user.id}
      @other_projects = @projects - @my_projects
    end
  end
end
