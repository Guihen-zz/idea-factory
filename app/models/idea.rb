class Idea < ActiveRecord::Base
	belongs_to :user, class_name: "User"
	has_one :project
end
