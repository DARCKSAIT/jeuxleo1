extends Resource
class_name Building

@export var name: String
@export var level: int = 1
@export var production_rate: float = 0.0
@export var resource_type: String = ""
@export var base_upgrade_cost: int = 50

func produce() -> int:
    return int(production_rate * level)

func upgrade_cost() -> int:
    return base_upgrade_cost * level

func upgrade() -> void:
    level += 1
    production_rate *= 1.2

