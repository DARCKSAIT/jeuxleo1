extends Resource
class_name Survivor

@export var name: String
@export var level: int = 1
@export var deck: Array[Card] = []
@export var experience: int = 0

func add_card(card: Card) -> void:
    deck.append(card)

func remove_card(card: Card) -> void:
    deck.erase(card)

func gain_experience(points: int) -> void:
    experience += points
    if experience >= level * 100:
        experience = 0
        level += 1

