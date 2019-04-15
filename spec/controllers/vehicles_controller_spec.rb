require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
	
	describe "GET the Vehicle Info for given vehicle ID" do
    
    it "Vehicle information for valid vehicle ID" do
      params = { id: 1235}
      get :show, params: params, format: :json
      expect(response.status).to eq(200)
    end


		it "Security door status for valid vehicle ID" do
      params = { id: 1234}
      get :doors, params: params, format: :json
      expect(response.status).to eq(200)
    end


		it "Fuel Info status for invalid vehicle ID" do
      params = { id: 123} # Vehicle id: 123 not found 
      get :fuel, params: params
      expect(JSON.parse(response.body)["status"]).to eq("404")
    end


    it "Fuel Info status" do
      params = { id: 1234}
      get :fuel, params: params
      expect(response.status).to eq(200)
    end

    # it "Battery level should be null for non electic car" do
    #   params = { id: 1234}
    #   get :fuel, params: params
    #   byebug
    #   expect(JSON.parse(response.body)["data"]["batteryLevel"]["value"]).to eq("null")
    # end

    it "Battery Info status" do
      params = { id: 1234}
      get :battery, params: params
      expect(response.status).to eq(200)
    end

    # it "Tank level should be null for electic ca" do
    #   params = { id: 1234}
    #   get :battery, params: params
    #   expect(JSON.parse(response.body)["data"]["tankLevel"]["value"]).to eq("null")
    # end

    it "Engine Start/Stop status" do
      params = { id: 1235}
      post :engine, params: params
      expect(response.status).to eq(200)
    end

	end

end
