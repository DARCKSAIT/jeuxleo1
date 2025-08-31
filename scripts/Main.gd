extends Node

var run_manager: RunManager

func _ready():
    print("Survivants project loaded.")
    run_manager = RunManager.new()
    add_child(run_manager)
    run_manager.unlock_next_building()

    var survivor: Survivor = load("res://resources/survivors/Nomade.tres")
    print("Loaded survivor %s with %d cards" % [survivor.name, survivor.deck.size()])
