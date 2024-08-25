extends Button

func _ready():
	# Conectar la señal 'pressed' del botón a la función '_on_Button_pressed'
	self.connect("pressed", Callable(self, "_on_Button_pressed"))

func _on_Button_pressed():
	# Cambiar el valor de InspectObject a true
	Global.InspectObject = false
	
	var hide_script = $"../HideScript"
	if hide_script:
		hide_script.handle_button_press()
