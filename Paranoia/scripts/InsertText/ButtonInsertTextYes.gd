extends Button

var endStartDialogue = false

func _ready():
	connect("pressed", Callable(self, "buttonPressed"))

func buttonPressed():
	var hideButtons =  $"../ControlYes&No"
	hideButtons.hide_buttons(self.name,"ButtonNoInsertText")
	endStartDialogue = true




