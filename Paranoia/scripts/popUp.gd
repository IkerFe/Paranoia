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
