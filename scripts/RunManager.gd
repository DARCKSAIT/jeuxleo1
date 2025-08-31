extends Node
class_name RunManager

var building_order: Array = [
    preload("res://resources/buildings/Farm.tres"),
    preload("res://resources/buildings/Factory.tres"),
    "Refuge",
    "Armory"
]
var unlocked_buildings: Array = []

var food: int = 0
var materials: int = 0

func unlock_next_building() -> void:
    if building_order.size() > unlocked_buildings.size():
        var next = building_order[unlocked_buildings.size()]
        unlocked_buildings.append(next)
        if next is Building:
            print("Unlocked %s" % next.name)
        else:
            print("Unlocked %s" % next)
