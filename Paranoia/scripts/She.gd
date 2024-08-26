extends Control

# Referencia al RichTextLabel que mostrará el diálogo
@export var dialogueProtagonist: RichTextLabel
@export var backgroundDialogueProtagonist: Sprite2D
var numActualDialogue:int = 0
# Para ocultarlo
func _ready():
	print("OrderDialogue Value: ", Global.OrderDialogue)  # Verifica el valor actual
	# Mostrar el primer diálogo al inicio
	match Global.OrderDialogue:
		1:
			Global.dialogue = [
				"FirstDialogue1",
				"FirstDialogue1.1",
				"FirstDialogue1.2",
				"FirstDialogue1.3",
				"FirstDialogue1.4",
				"FirstDialogue1.5",
			]
		2:
			Global.dialogue = [
				"FirstDialogue2",
				"FirstDialogue2.1",
				"FirstDialogue2.2",
			]
	
	Global.update_dialogue_text(dialogueProtagonist, numActualDialogue)

func _input(event):
	if event.is_pressed() and (
	event is InputEventMouseButton and event.button_index != MOUSE_BUTTON_WHEEL_UP and event.button_index != MOUSE_BUTTON_WHEEL_DOWN
	or event is InputEventScreenTouch
	or event is InputEventKey and (event.keycode == KEY_ENTER or event.keycode == KEY_SPACE)):
		avanzar_dialogo()

func avanzar_dialogo():
	# Si hay más diálogos disponibles, actualiza el texto
	if numActualDialogue < Global.dialogue.size() - 1:
		numActualDialogue += 1
		print(numActualDialogue)
		Global.update_dialogue_text(dialogueProtagonist,numActualDialogue)
	else:
		match Global.OrderDialogue:
			1:
				var textProta = $"TextProta"
				textProta.protagonistTextDisappear()
				var popUp_script = $"PopUpScript"
				popUp_script.popUpAppear()
			2:
				var hide_script = $HideScript
				hide_script.handle_button_press()
				Global.Dialogue = false
				queue_free()
