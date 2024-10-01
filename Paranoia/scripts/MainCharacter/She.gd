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
	
	if Global.EndDialogue == true:
		end_dialogue()
		
	elif event.is_pressed() and (
	event is InputEventMouseButton and event.button_index != MOUSE_BUTTON_WHEEL_UP and event.button_index != MOUSE_BUTTON_WHEEL_DOWN
	or event is InputEventScreenTouch
	or event is InputEventKey and (event.keycode == KEY_ENTER or event.keycode == KEY_SPACE)):
		Global.avanzar_dialogo(dialogueProtagonist)



func end_dialogue():
		match Global.OrderDialogue:
			4:
				var textProta = $"TextProta"
				textProta.protagonistTextDisappear()
				var popUp_script = $"PopUpScript"
				popUp_script.popUpAppear()
			2:
				Global.DialogueActive = false
				var textProta = $"TextProta"
				textProta.endProtagonistGrupText()
				
			3:
				var textProta = $"TextProta"
				textProta.protagonistTextDisappear()
				var insertText = $"InsertText2"
				insertText.showPlayerInsertText()
				
				
			1: 
				var showButtonsInsert = $"ButtonYesInsertText"
				var showInsertButtons = $"ControlYes&No"
				showInsertButtons.show_buttons("ButtonYesInsertText","ButtonNoInsertText")
				
				if(showButtonsInsert.endStartDialogue == true):
					var showButtons = $"HideScript"
					showButtons.handle_button_press()
					queue_free()
