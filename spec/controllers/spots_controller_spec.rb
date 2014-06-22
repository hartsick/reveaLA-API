require 'rails_helper'

RSpec.describe SpotsController, :type => :controller do

  describe "GET 'index'" do
    it "should succeed" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "should succeed" do
      get 'show'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do

    describe 'logged in user' do
      let :user do
        FactoryGirl.build_stubbed(:user)
      end

      it "should succeed" do
        post :create
        expect(response).to be_success
      end

      describe "successful create" do
        let :spot_params do
          {
            # add params
          }
        end

        it "should create a spot" do
          expect do
            post :create, :spot => spot_params
          end.to change(Spot, :count).by(1)
        end

        it "should respond with created code" do
          post :create, :spot => spot_params
          response.status.should == 201
        end

        it "should wrap around spot" do
          post :create, :spot => spot_params
          JSON.parse(response.body).should include('spot')
        end
    end    

    describe 'logged in admin' do
      let :admin do
        FactoryGirl.build_stubbed(:admin)
      end
      it "should succeed" do
        post :create
        expect(response).to be_success
      end
    end

    describe 'not logged in' do
      it "should not be authorized" do
        post :create
        response.status.should == 401
      end
    end
  end

  describe "PUT 'update'" do
    describe 'logged in admin' do
      it "should succeed" do
        put :update, id: spot.id
        expect(response).to be_success
      end
    end
    describe 'logged in user' do
      it "should not be authorized" do
        put :update, id: spot.id
        response.status.should == 401
      end
    end
    describe 'not logged in' do
      it "should not be authorized" do
        put :update, id: spot.id
        response.status.should == 401
      end
    end
  end

  describe "POST 'destroy'" do
    describe 'logged in admin' do
      let :admin do
        FactoryGirl.build_stubbed(:admin)
      end
      it "should succeed" do
      end
    end    
    describe 'logged in user' do
      let :user do
        FactoryGirl.build_stubbed(:user)
      end
      it "should not be authorized" do
        post :destroy, id: spot.id
        response.status.should == 401
      end
    end    
    describe 'not logged in' do
      it "should not be authorized" do
        post :destroy, id: spot.id
        response.status.should == 401
      end
    end
  end

end
