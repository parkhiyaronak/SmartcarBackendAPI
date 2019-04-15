json.vin @vehicle_info["vin"]["value"]
json.color @vehicle_info["color"]["value"]
json.doorCount @vehicle_info["fourDoorSedan"]["value"] == "True" ? 4 : 2 #setting door cound based on fourDoorSedan or twoDoorCoupe
json.driveTrain @vehicle_info["driveTrain"]["value"]