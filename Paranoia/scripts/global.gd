extends Node

var  InspectObject: bool = false
var  DialogueActive: bool = true
var  OrderDialogue: int = 2
# Array con los diálogos
var dialogue = []

# Función para actualizar el texto traducido en el RichTextLabel
func update_dialogue_text(dialogueProtagonist: RichTextLabel, numActualDialogue: int) -> void:
	# Traducir la clave antes de asignarla al RichTextLabel
	var translated_text = tr(dialogue[numActualDialogue])
	dialogueProtagonist.bbcode_text = translated_text


