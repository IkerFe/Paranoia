extends Button

# Propiedad exportada para el nombre de la escena
@export var scene_name: String

# Función que se llama cuando el botón es presionado
func _on_button_pressed():
	if scene_name:
		var scene_path = "res://scenes/" + scene_name + ".tscn"
		var scene = load(scene_path)
		if scene:
			get_tree().change_scene_to_packed(scene)
		else:
			print("No se pudo cargar la escena: " + scene_path)
	else:
		print("El nombre de la escena no está establecido")

# Función _ready que conecta la señal 'pressed' al método _on_button_pressed
func _ready():
	self.connect("pressed", Callable(self, "_on_button_pressed"))
