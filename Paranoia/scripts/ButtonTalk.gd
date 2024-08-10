extends Button

var popup_menu: PopupMenu

func _ready():
	# Crear y configurar el PopupMenu
	popup_menu = PopupMenu.new()
	add_child(popup_menu)
	
	# Agregar opciones al PopupMenu
	popup_menu.add_item("StartDialogue1", 1)
	popup_menu.add_item("StartDialogue2", 2)
	popup_menu.add_item("StartDialogue3", 3)
	
	# Conectar la señal id_pressed del PopupMenu al método _on_item_pressed
	popup_menu.connect("id_pressed", Callable(self, "_on_item_pressed"))
	
	# Conectar la señal de clic del botón al método _on_button_pressed
	connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_pressed():
	var popup_size = popup_menu.get_size()
	popup_menu.set_size(popup_size)
	
	# Mostrar el PopupMenu en el centro de la pantalla
	popup_menu.popup_centered()
		# Determina el tamaño de la pantalla
	var screen_size = get_viewport().get_visible_rect().size

	# Determina el tamaño del popup

	# Calcula la posición a la izquierda
	var position = Vector2(0, screen_size.y / 2 - popup_size.y / 2) # Centrado verticalmente, a la izquierda

	# Establece la posición
	popup_menu.set_position(position)




func _on_item_pressed(id: int):
	popup_menu.popup_centered()
	match id:
		1:
			print("Opción 1 seleccionada")
			# Eliminar la Opción 1
			popup_menu.remove_item(2) # Índice del item (empieza desde 0)
			popup_menu.remove_item(1) # Índice del item (empieza desde 1)
			popup_menu.remove_item(0) # Índice del item (empieza desde 2)
			
			# Agregar nuevas opciones
			popup_menu.add_item("StartDialogue1.1", 0)
		2:
			print("Opción 2 seleccionada")
		3:
			print("Opción 3 seleccionada")
		4:
			print("Nueva Opción 1 seleccionada")
		5:
			print("Nueva Opción 2 seleccionada")
