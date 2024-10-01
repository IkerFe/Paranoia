extends Node

@export var text: RichTextLabel
@export var background: Sprite2D

func protagonistTextDisappear():
	text.visible = false
	background.visible = false

func endProtagonistGrupText():
	Global.OrderDialogue += 1
	Global.NumActualDialogue = -1
	Global.TextDialogueProta()
	Global.avanzar_dialogo(text)

func protagonistTextAppear():
	Global.EndDialogue = false
	endProtagonistGrupText()
	text.visible = true
	background.visible = true
	Global.DialogueActive = true

