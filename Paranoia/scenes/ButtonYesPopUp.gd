extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_pressed():
	var popUp_script = $"../PopUpScript"
	popUp_script.popUpDisappear()
	var textProta = $"../TextProta"
	textProta.protagonistTextAppear()
