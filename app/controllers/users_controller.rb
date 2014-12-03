class UsersController < ApplicationController

	def unsubscribe
		project = Project.find(params[:id])
		project.users=  project.users - [current_user]
		project.save

		redirect_to :back
	end
end