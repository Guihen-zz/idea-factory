require "rails_helper"

describe IdeasController, :type => :routing do
    describe "routing" do
        it { is_expected.to route(:get, '/').
            to(controller: :ideas, action: :index) }
    end
end