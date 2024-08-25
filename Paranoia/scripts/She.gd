extends Control

# Array con los diálogos
var dialogue = []

# Índice del diálogo actual
var numActualDialogue = 0

# Referencia al RichTextLabel que mostrará el diálogo
@export var dialogueProtagonist: RichTextLabel
# Para ocultarlo
@onready var hide_script = $HideScript

func _ready():
	# Mostrar el primer diálogo al inicio
	match Global.NumDialogue:
		1:
			dialogue = [
				"FirstDialogue1",
				"FirstDialogue1.1",
				"FirstDialogue1.2",
				"FirstDialogue1.3",
				"FirstDialogue1.4",
				"FirstDialogue1.5",
			]
		2:
			dialogue = [
				"FirstDialogue2",
				"FirstDialogue2.1",
				"FirstDialogue2.2",
			]
	
	update_dialogue_text()

	Global.Dialogue = true
	if hide_script:
		hide_script.handle_button_press()

func _input(event):
	if event.is_pressed() and (event is InputEventMouseButton or event is InputEventScreenTouch):
		avanzar_dialogo()

func avanzar_dialogo():
	# Si hay más diálogos disponibles, actualiza el texto
	if numActualDialogue < dialogue.size() - 1:
		numActualDialogue += 1
		print(numActualDialogue)
		update_dialogue_text()
	else:
		match Global.NumDialogue:
			1:
				dialogueProtagonist.visible = false
				var popUp_script = $"PopUpScript"
				if popUp_script:
					popUp_script.popUpAppear()
			2:
				hide_script.handle_button_press()
				Global.Dialogue = false
				queue_free()

# Función para actualizar el texto traducido en el RichTextLabel
func update_dialogue_text():
	# Traducir la clave antes de asignarla al RichTextLabel
	var translated_text = tr(dialogue[numActualDialogue])
	dialogueProtagonist.bbcode_text = "[color=red]" + translated_text + "[/color]"
