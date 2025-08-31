extends Node
class_name RunManager

var building_order: Array = [
    preload("res://resources/buildings/Farm.tres"),
    preload("res://resources/buildings/Factory.tres"),
    preload("res://resources/buildings/Refuge.tres"),
    preload("res://resources/buildings/Armory.tres")
]
var unlocked_buildings: Array = []
    "Refuge",
    "Armory"
]
var unlocked_buildings: Array = []
var building_order := ["Farm", "Factory", "Refuge", "Armory"]
var unlocked_buildings: Array[String] = []

var food: int = 0
var materials: int = 0

var survivors: Array = []
var survivor_pool: Array = [
    preload("res://resources/survivors/Nomade.tres"),
    preload("res://resources/survivors/Guerrier.tres"),
    preload("res://resources/survivors/Medecin.tres")
]

func _ready() -> void:
    randomize()

func unlock_next_building() -> void:
    if building_order.size() > unlocked_buildings.size():
        var next: Building = building_order[unlocked_buildings.size()].duplicate()
        unlocked_buildings.append(next)
        print("Unlocked %s" % next.name)

func process_turn() -> void:
    for b in unlocked_buildings:
        if b is Building:
            var amount = b.produce()
            match b.resource_type:
                "food":
                    food += amount
                "materials":
                    materials += amount

func upgrade_building(index: int) -> void:
    if index < 0 or index >= unlocked_buildings.size():
        return
    var b: Building = unlocked_buildings[index]
    var cost = b.upgrade_cost()
    if materials >= cost:
        materials -= cost
        b.upgrade()
        print("%s upgraded to level %d" % [b.name, b.level])
    else:
        print("Not enough materials to upgrade %s" % b.name)

func recruit_survivor() -> void:
    var cost = 100
    if food < cost:
        print("Not enough food to recruit.")
        return
    food -= cost
    var res: Survivor = survivor_pool[randi() % survivor_pool.size()].duplicate()
    survivors.append(res)
    print("Recruited %s" % res.name)
func unlock_next_building() -> void:
    if building_order.size() > unlocked_buildings.size():
        var next = building_order[unlocked_buildings.size()]
        unlocked_buildings.append(next)
        if next is Building:
            print("Unlocked %s" % next.name)
        else:
            print("Unlocked %s" % next)
        print("Unlocked %s" % next)
