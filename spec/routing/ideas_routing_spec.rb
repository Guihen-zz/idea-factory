describe IdeasController, :type => :routing do

  let(:idea) { FactoryGirl.create(:idea) }

  describe "routing" do
    it { expect(:get => ideas_path).to route_to(action: 'index', controller: 'ideas') }
    it { expect(:get => idea_path(idea.id)).
      to route_to(action: 'show', controller: 'ideas', id: idea.id.to_s) }
    it { expect(:get => new_idea_path).to route_to(action: 'new', controller: 'ideas') }
    it { expect(:post => ideas_path).to route_to(action: 'create', controller: 'ideas') }
    it { expect(:get => edit_idea_path(idea.id)).
      to route_to(action: 'edit', controller: 'ideas', id: idea.id.to_s) }
    it { expect(:patch => idea_path(idea.id)).
      to route_to(action: 'update', controller: 'ideas', id: idea.id.to_s) }
    it { expect(:delete => idea_path(idea.id)).
      to route_to(action: 'destroy', controller: 'ideas', id: idea.id.to_s) }
  end
end