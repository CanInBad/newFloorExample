extends EventBase

func _init():
	id = "exampleFloorEnter"


func registerTriggers(es):
    # add lisen triggers, this event will run when its triggered

    es.addTrigger(self, Trigger.EnteringRoom, "CellblockRoom") # entrance
    es.addTrigger(self, Trigger.EnteringRoom, "helloWorldEntrance") # exit

# what happens when register
func run(_triggerID, _args):
    if _triggerID == "EnteringRoom": # safe guard even though it shouldn't be possible to have other triggers in here

        match _args[0]: # If you don't know what's this, please consult https://docs.godotengine.org/en/3.5/tutorials/scripting/gdscript/gdscript_basics.html#match
            # basically fancy if statement use to match specific strings in _args's first index
            "CellblockRoom": # entrance
                sayn("\n"+"Why is there a hole in the wall?")
                addButton("Hole in the wall", "Why is nobody noticing this?", "go") # Adds a button to enter
            "helloWorldEntrance": # exit
                sayn("\n"+"This is weird...")
                addButton("Back", "This is weird", "leave") # Adds a button to leave

func getPriority():
    return 0

func onButton(_method, _args):
    match _method:
        "go": # if the method is go
            GM.pc.setLocation("helloWorldEntrance")
            GM.main.reRun()
        "leave": # if the method is leave
            GM.pc.setLocation("CellblockRoom")
            GM.main.reRun()