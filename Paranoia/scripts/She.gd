extends Control

# Referencia al RichTextLabel que mostrará el diálogo
@export var dialogueProtagonist: RichTextLabel
@export var backgroundDialogueProtagonist: Sprite2D

# Para ocultarlo
func _ready():
	Global.DialogueActive = true
	Global.TextDialogueProta()
	Global.avanzar_dialogo(dialogueProtagonist)

func _input(event):
	if event.is_pressed() and (
	event is InputEventMouseButton and event.button_index != MOUSE_BUTTON_WHEEL_UP and event.button_index != MOUSE_BUTTON_WHEEL_DOWN
	or event is InputEventScreenTouch
	or event is InputEventKey and (event.keycode == KEY_ENTER or event.keycode == KEY_SPACE)):
		Global.avanzar_dialogo(dialogueProtagonist)
	if Global.EndDialogue == true:
		end_dialogue()

func end_dialogue():
		match Global.OrderDialogue:
			1:
				var textProta = $"TextProta"
				textProta.protagonistTextDisappear()
				var popUp_script = $"PopUpScript"
				popUp_script.popUpAppear()
			2:
				print("OrderDialogue Value: ", Global.OrderDialogue)  # Verifica el valor actual
				var hide_script = $HideScript
				hide_script.handle_button_press()
				Global.DialogueActive = false
				queue_free()
