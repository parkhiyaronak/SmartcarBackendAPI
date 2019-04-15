#Iterating over the each values of door from the response body
json.array! @door_info["values"].each do |door|
	json.location door["location"]["value"]
	json.locked door["locked"]["value"]
end