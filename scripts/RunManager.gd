extends Node
class_name RunManager

var building_order := ["Farm", "Factory", "Refuge", "Armory"]
var unlocked_buildings: Array[String] = []

var food: int = 0
var materials: int = 0

func unlock_next_building() -> void:
    if building_order.size() > unlocked_buildings.size():
        var next = building_order[unlocked_buildings.size()]
        unlocked_buildings.append(next)
        print("Unlocked %s" % next)
