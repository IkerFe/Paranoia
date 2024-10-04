extends Sprite2D

# Carga las dos imágenes
@export var default_texture : Texture2D
@export var hover_texture : Texture2D

# Variable para mantener el estado del clic
var clicked = false
var mouse_over = false

func _ready():
	# Conecta las señales del Area2D	
	$Area2D.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	$Area2D.connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	$Area2D.connect("input_event", Callable(self, "_on_input_event"))

	# Establece la textura inicial
	texture = default_texture
	
	

func _process(delta):
	if Global.InspectObject:
		if clicked:
			texture = default_texture
		else:
			texture = hover_texture if mouse_over else default_texture
	else:
		texture = default_texture

func _on_mouse_entered():
	mouse_over = true

func _on_mouse_exited():
	mouse_over = false

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.InspectObject:
		clicked = true




