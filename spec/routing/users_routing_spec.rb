describe UsersController, :type => :routing do

  describe "routing" do
    it { expect(:post => subscribe_path(1)).to route_to(action: 'subscribe', controller: 'users', id: '1') }
    it { expect(:delete => unsubscribe_path(1)).to route_to(action: 'unsubscribe', controller: 'users', id: '1') }
  end
end