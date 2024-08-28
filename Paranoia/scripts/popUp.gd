extends Node

@export var popUp : Sprite2D
@export var yesButton : Button
@export var noButton : Button
@export var popUpText: RichTextLabel
func popUpAppear():
	popUp.visible = true
	yesButton.visible = true
	noButton.visible = true
	popUpText.visible = true
	
func popUpDisappear():
	popUp.visible = false
	yesButton.visible = false
	noButton.visible = false
	popUpText.visible = false

func _ready():
	match Global.OrderDialogue:
		1:
			Global.Dialogue = [
				"ContractUnderAge",
			]
	Global.update_dialogue_text(popUpText)
