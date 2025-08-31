extends Node
class_name RunManager

var building_order: Array[Building] = [
    preload("res://resources/buildings/Farm.tres"),
    preload("res://resources/buildings/Factory.tres"),
    preload("res://resources/buildings/Refuge.tres"),
    preload("res://resources/buildings/Armory.tres"),
]

var unlocked_buildings: Array[Building] = []

var food: int = 0
var materials: int = 0

var survivors: Array[Survivor] = []
var survivor_pool: Array[Survivor] = [
    preload("res://resources/survivors/Nomade.tres"),
    preload("res://resources/survivors/Guerrier.tres"),
    preload("res://resources/survivors/Medecin.tres"),
]

func _ready() -> void:
    randomize()

func unlock_next_building() -> void:
    if unlocked_buildings.size() >= building_order.size():
        return
    var template: Building = building_order[unlocked_buildings.size()]
    var new_building: Building = template.duplicate()
    unlocked_buildings.append(new_building)
    print("Unlocked %s" % new_building.name)

func process_turn() -> void:
    for b in unlocked_buildings:
        var amount := b.produce()
        match b.resource_type:
            "food":
                food += amount
            "materials":
                materials += amount

func upgrade_building(index: int) -> void:
    if index < 0 or index >= unlocked_buildings.size():
        return
    var b: Building = unlocked_buildings[index]
    var cost := b.upgrade_cost()
    if materials < cost:
        print("Not enough materials to upgrade %s" % b.name)
        return
    materials -= cost
    b.upgrade()
    print("%s upgraded to level %d" % [b.name, b.level])

func recruit_survivor() -> void:
    var cost := 100
    if food < cost:
        print("Not enough food to recruit.")
        return
    food -= cost
    var template: Survivor = survivor_pool[randi() % survivor_pool.size()]
    var res: Survivor = template.duplicate()
    survivors.append(res)
    print("Recruited %s" % res.name)

