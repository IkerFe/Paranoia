extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", Callable(self, "buttonPressed"))

func buttonPressed():
	var popUp_script = $"../PopUpScript"
	popUp_script.popUpDisappear()
	var textProta = $"../TextProta"
	textProta.protagonistTextAppear()
	queue_free()
