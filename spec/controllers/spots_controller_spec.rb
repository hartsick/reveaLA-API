require 'rails_helper'

RSpec.describe SpotsController, :type => :controller do

  describe "GET 'index'" do
    it "should succeed" do
      get :index
      expect(response).to be_success
    end
    xit "should only show approved spots" do
    end
  end

  describe "GET 'show'" do
    let :spot do
      FactoryGirl.create(:spot)
    end

    it "should succeed" do
      get 'show', id: spot.id
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
            name: 'Machine Project',
            type: 'Arts',
            street: '1200 N Alvarado St',
            city: 'Los Angeles',
            zip: '90026',
            state: 'CA'
          }
        end

        it "should create a spot" do
          expect do
            post :create, :spot => spot_params
          end.to change(Spot, :count).by(1)
        end

        it "should respond with created code" do
          post :create, :spot => spot_params
          expect(response.status).to eq(201)
        end

        xit "should store id of user that created it" do
          post :create, :spot => spot_params
          expect().to eq(:user.id)
        end

        it "should wrap around spot" do
          post :create, :spot => spot_params
          JSON.parse(response.body).should include('spot')
        end
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
        expect(response.status).to eq(401)
      end
    end
  end

  describe "PUT 'update'" do
    let :spot do
      FactoryGirl.create(:spot)
    end

    describe 'logged in admin' do
      let :admin do
        FactoryGirl.build_stubbed(:admin)
      end      
      it "should succeed" do
        put :update, id: spot.id
        expect(response).to be_success
      end
    end

    describe 'logged in user' do
      let :user do
        FactoryGirl.build_stubbed(:user)
      end
      it "should not be authorized" do
        put :update, id: spot.id
        expect(response.status).to eq(401)
      end
    end

    describe 'not logged in' do
      it "should not be authorized" do
        put :update, id: spot.id
        expect(response.status).to eq(401)
      end
    end
  end

  describe "POST 'destroy'" do
    let :spot do
      FactoryGirl.create(:spot)
    end

    describe 'logged in admin' do
      let :admin do
        FactoryGirl.build_stubbed(:admin)
      end
      it "should succeed" do
        post :destroy, id: spot.id
        expect(response).to be_success
      end
      it "should delete a spot" do
        expect do
          post :destroy, id: spot.id
        end.to change(Spot, :count).by(1)
      end
    end    

    describe 'logged in user' do
      let :user do
        FactoryGirl.build_stubbed(:user)
      end
      it "should not be authorized" do
        post :destroy, id: spot.id
        expect(response.status).to eq(401)
      end
    end    

    describe 'not logged in' do
      it "should not be authorized" do
        post :destroy, id: spot.id
        expect(response.status).to eq(401)
      end
    end
  end

end
