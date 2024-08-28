extends Node

var  InspectObject: bool = false
var  DialogueActive: bool = false
var  EndDialogue: bool = false
var  OrderDialogue: int = 1
var  NumActualDialogue:int = -1
var  Dialogue = []
# Array con los diálogos
func TextDialogueProta():
	match OrderDialogue:
		1:
			Dialogue = [
				"FirstDialogue1",
				"FirstDialogue1.1",
				"FirstDialogue1.2",
				"FirstDialogue1.3",
				"FirstDialogue1.4",
				"FirstDialogue1.5",
				]
		2:
			Dialogue = [
				"FirstDialogue2",
				"FirstDialogue2.1",
				"FirstDialogue2.2",
			]
# Función para actualizar el texto traducido en el RichTextLabel
func update_dialogue_text(dialogueProtagonist: RichTextLabel) -> void:
	# Traducir la clave antes de asignarla al RichTextLabel
		#print("OrderDialogue Value: ", Global.OrderDialogue)  # Verifica el valor actual
		var translated_text = tr(Dialogue[NumActualDialogue])
		dialogueProtagonist.bbcode_text = "[color=green]" + translated_text + "[/color]"

func avanzar_dialogo(dialogueProtagonist: RichTextLabel):
	# Si hay más diálogos disponibles, actualiza el texto
	if Global.NumActualDialogue < Global.Dialogue.size() - 1 :
		Global.NumActualDialogue += 1
		update_dialogue_text(dialogueProtagonist)
		print("OrderDialogue Value: ", Global.NumActualDialogue)  # Verifica el valor actual
	else:
		EndDialogue = true
