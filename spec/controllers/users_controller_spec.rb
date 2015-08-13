require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#new" do
    before do
      get :new
    end

    it "should respond with 200 success" do
      expect(response.status).to be(200)
    end

    it "should assign @user" do
      expect(assigns(:user)).to be_instance_of(User)
    end

    it "should render the :new view" do
      expect(response).to render_template(:new)
    end
  end

end