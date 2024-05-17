extends Module

func _init():
    # Hello there! Please consult README if you do not know what this is.

    id = "newFloorExampleCIB"
    author = "CanInBad"

    # Where is floor scene located.
    var theFloor = "res://Modules/newFloorExample/floors/helloWorld.tscn"

    # registering the floor, first agrument is for ID while the second is the path to tscn floor.
    GlobalRegistry.registerMapFloor("helloWorld", theFloor)

    # the event is responsible for transporting player to 1 location to another.
    events = [
        "res://Modules/newFloorExample/events/gotoFloor.gd",
    ]