extends Node

@export var text: RichTextLabel
@export var background: Sprite2D

func protagonistTextDisappear():
	text.visible = false
	background.visible = false
	
func protagonistTextAppear():
	Global.OrderDialogue = 2
	Global.numActualDialogue = 0
	text.visible = true
	background.visible = true

