require 'rails_helper'

RSpec.describe SpotsController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    describe 'logged in user or admin' do
      it "returns http success" do
      end
    end
    describe 'not logged in' do
      it "should not be authorized" do
        post :create, id: spot.id
        response.status.should == 401
      end
    end
  end

  describe "PUT 'update'" do
    describe 'logged in admin' do
      it "returns http success" do
      end
    end
    describe 'not admin' do
      it "should not be authorized" do
        put :update, id: spot.id
        response.status.should == 401
      end
    end
  end

  describe "POST 'destroy'" do
    describe 'logged in admin' do
      it "returns http success" do
      end
    end    
    describe 'not admin' do
      it "should not be authorized" do
        post :destroy, id: spot.id
        response.status.should == 401
      end
    end
  end

end
