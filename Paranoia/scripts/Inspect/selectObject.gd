extends Sprite2D

# Carga las dos imágenes
@export var default_texture : Texture2D
@export var hover_texture : Texture2D
@export var text_message_unlocked : String  # El nombre de la opción que se añadirá

# Variable para mantener el estado del clic
var clicked = false
var mouse_over = false

# Referencia al PopupMenu
var popup_menu: PopupMenu

func _ready():
	# Conecta las señales del Area2D	
	$Area2D.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	$Area2D.connect("mouse_exited", Callable(self, "_on_mouse_exited"))
	$Area2D.connect("input_event", Callable(self, "_on_input_event"))

	# Establece la textura inicial
	texture = default_texture

	# Crear y configurar el PopupMenu
	popup_menu = PopupMenu.new()
	add_child(popup_menu)
	
	# Agregar opciones al PopupMenu
	popup_menu.add_item("Opción 1", 1)
	popup_menu.add_item("Opción 2", 2)
	popup_menu.add_item("Opción 3", 3)
	
	# Conectar la señal id_pressed del PopupMenu al método _on_item_pressed
	popup_menu.connect("id_pressed", Callable(self, "_on_item_pressed"))

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
		clicked = !clicked
		if clicked:
			_add_unlocked_option()

func _add_unlocked_option():
	# Añade una nueva opción al PopupMenu con el nombre de `text_message_unlocked`
	if text_message_unlocked != "":
		# Verificar que la opción no se haya añadido previamente
		if not popup_menu.has_item(text_message_unlocked):
			var new_id = popup_menu.get_item_count() + 1
			popup_menu.add_item(text_message_unlocked, new_id)
			print("Opción añadida: %s" % text_message_unlocked)

func _on_item_pressed(id: int):
	# Manejar la selección de opciones en el PopupMenu
	var selected_text = popup_menu.get_item_text(id)
	print("%s seleccionada" % selected_text)
