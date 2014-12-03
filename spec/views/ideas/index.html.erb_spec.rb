require 'rails_helper'

describe "ideas/index.html.erb" do 
	context "when user not authenticated" do
		let(:idea) { Idea.create(name: "Super idea de test", deadline: "2014-12-31") }

		it "should not render the edit/destroy buttons" do
			# redirect_to ideas_path
			# puts page.inspect
			# visit root_path
			# puts response.inspect

			# puts rendered.inspect
			# puts "estamos ficando loucous!"
		end
	end
end