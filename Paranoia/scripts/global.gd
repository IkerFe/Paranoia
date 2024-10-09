extends Node

var  InspectObject: bool = false
var  DialogueActive: bool = true
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
		3:
			Dialogue = [
				"NameSelector1.1",
				"NameSelector1.2"
			]
		100:
			Dialogue = [
				"ProtagonistWindow1",
				"ProtagonistWindow2"
			]
		101:
			Dialogue = [
				"Me muero",
				"A Y U D A  :C"
			]
# Función para actualizar el texto traducido en el RichTextLabel
func update_dialogue_text(dialogueProtagonist: RichTextLabel) -> void:
	var translated_text = tr(Dialogue[NumActualDialogue])
	dialogueProtagonist.bbcode_text = "[color=yellow]" + translated_text + "[/color]"



func avanzar_dialogo(dialogueProtagonist: RichTextLabel):
	# Si hay más diálogos disponibles, actualiza el texto
	if Global.NumActualDialogue < Global.Dialogue.size() - 1 :
		Global.NumActualDialogue += 1
		update_dialogue_text(dialogueProtagonist)
		#print("OrderDialogue Value: ", Global.NumActualDialogue)  # Verifica el valor actual
	else:
		EndDialogue = true
