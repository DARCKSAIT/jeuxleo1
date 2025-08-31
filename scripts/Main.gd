extends Node

var run_manager: RunManager

func _ready():
    print("Survivants project loaded.")
    run_manager = RunManager.new()
    add_child(run_manager)
    run_manager.unlock_next_building()
    run_manager.process_turn()
    run_manager.food = 150
    run_manager.recruit_survivor()
    if run_manager.survivors.size() > 0:
        var survivor: Survivor = run_manager.survivors[0]
        print("Recruited survivor %s with %d cards" % [survivor.name, survivor.deck.size()])

    var survivor: Survivor = load("res://resources/survivors/Nomade.tres")
    print("Loaded survivor %s with %d cards" % [survivor.name, survivor.deck.size()])
