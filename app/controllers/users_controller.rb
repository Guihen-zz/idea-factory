class UsersController < ApplicationController

	def unsubscribe
		project = Project.find(params[:id])
		project.users=  project.users - [current_user]

		if project.users.empty?
			project.destroy!
		else
			project.save
		end

		redirect_to :back
	end

	def subscribe
		project = Project.find(params[:id])
		project.users=  project.users + [current_user]
		project.save

		redirect_to :back
	end
end