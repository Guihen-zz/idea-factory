describe IdeasController do

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  context 'when user has signed in' do
    let(:idea) { FactoryGirl.create(:idea) }

    before :each do
      sign_in FactoryGirl.create(:user)
    end

    describe 'GET new' do

      it "should render the new template" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "GET edit" do

      it "should render the edit template" do
        get :edit, id: idea.id
        expect(response).to render_template(:edit)
      end
    end

    describe "POST create" do

      it "should redirect to ideas show" do
        post :create, idea: attributes_for(:idea)
        expect(response).to have_http_status(:redirect)
      end

      context 'with invalid informations' do
        it 'should render new template with error' do
          post :create, idea:  attributes_for(:invalid_idea)
          expect(response).to render_template(:new)
        end
      end
    end

    describe "PUT update" do

      it 'should redirect to ideas show' do
        patch :update, id: idea.id, idea:  attributes_for(:idea)
        expect(response).to have_http_status(:redirect)
      end

      context 'with invalid informations' do
        it 'should render edit template with error' do
          patch :update, id: idea.id, idea:  attributes_for(:invalid_idea)
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE destroy' do

      it 'should redirect to index' do
        delete :destroy, id: idea.id
        expect(response).to redirect_to(ideas_path)
      end

    end
  end
end