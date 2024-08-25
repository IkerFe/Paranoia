extends Node

# Referencias a los botones que se van a ocultar
@export var button1 : Button
@export var button2 : Button
@export var button3 : Button
@export var button4 : Button

# Referencia al botón que se va a mostrar
@export var button_new : Button

# Función que se llama para manejar la visibilidad de los botones
func handle_button_press():
	# Ocultar los cuatro botones
	button1.visible =! button1.visible
	button2.visible =! button2.visible
	button3.visible =! button3.visible
	button4.visible =! button4.visible
	if Global.Dialogue == false:
		button_new.visible =! button_new.visible
