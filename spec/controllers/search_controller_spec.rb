require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  describe "GET idea" do
    it "returns http success" do
      get :idea
      expect(response).to be_success
    end
  end

  describe "GET project" do
    it "returns http success" do
      get :project
      expect(response).to be_success
    end
  end

end
