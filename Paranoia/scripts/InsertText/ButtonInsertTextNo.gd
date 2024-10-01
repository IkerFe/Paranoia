extends Button

@export var mi_variable: int = 0

func _ready():
	connect("pressed", Callable(self, "buttonPressed"))

func buttonPressed():
	var showButtons =  $"../ControlYes&No"
	showButtons.hide_buttons("ButtonYesInsertText","ButtonNoInsertText")
	var insertText =  $"../InsertText2"
	insertText.showPlayerInsertText()
	Global.OrderDialogue = 3
