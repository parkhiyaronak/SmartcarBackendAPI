class VehiclesController < ApplicationController
	skip_before_action :verify_authenticity_token
	include GmUtilities
		
	# Provides the Vehicle Info for given vehicle id.
	# Vehicle Info
  	# GET /vehicles/:id
  	# == Returns
  	# JSON
	def show
		response = get_information("getVehicleInfoService")
		render json: response and return unless response["status"] == "200"
		@vehicle_info = response["data"] 
	end

	# Provides the Doors Info for given vehicle id.
	# Security
  	# GET 	GET /vehicles/:id/doors
  	# == Returns
  	# JSON
	def doors
		response = get_information("getSecurityStatusService")
		render json: response and return unless response["status"] == "200"
		@door_info = response["data"]["doors"] 
	end

	# Provides the Fuel Range for given vehicle id.
	# Fuel Range
  	# GET 	GET /vehicles/:id/fuel
  	# == Returns
  	# JSON
	def fuel
		response = get_information("getEnergyService")
		render json: response and return unless response["status"] == "200"
		render json: {percent: response["data"]["tankLevel"]["value"]} #percent value will be null for EV vehicles
	end

	# Provides the Battery Range for given vehicle id.
	# Battery Range
  	# GET 	GET /vehicles/:id/battery
  	# == Returns
  	# JSON
	def battery
		response = get_information("getEnergyService")
		render json: response and return unless response["status"] == "200"
		render json: {percent: response["data"]["batteryLevel"]["value"]} #percent value will be null for fuel vehicles
	end

  	# It wil Start/Stop the Engine for given vehicle id.
	# Start/Stop Enginee
  	# GET 	GET /vehicles/:id/engine
  	# == Returns
  	# JSON
	def engine
		#selecting randon kind of action as there is no UI for making this request
		action = ["START", "STOP"].sample #Idealy action parameter will be from client's post request i.e params[:action]
		extra_params = {:command => action == "START" ? "START_VEHICLE" : "STOP_VEHICLE"} #setting command parameter as GM's actionEngineService API required this paramter while making the post request
		response = get_information("actionEngineService", extra_params)
		render json: response and return unless response["status"] == "200"
		render json: {status: response["actionResult"]["status"]}
	end

	def home
	end

end

