require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do

  let(:my_wiki) { create(:wiki) }
  let(:user)    { create(:user) }

  context "member doing CRUD action on wikis" do


  describe "GET #show" do
    it "returns http success" do
      get :show, id: my_wiki.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, id: my_wiki.id
      expect(response).to render_template :show
    end

    it "assigns my_wiki to @wiki" do
      get :show, id: my_wiki.id
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end

end
