extends Node

func _toggle_buttons(show: bool, buttonTrue: String, buttonFalse: String) -> void:
 # Intentar obtener buttonYes usando get_node_or_null
	var buttonYes = get_node_or_null("../" + buttonTrue)
	if buttonYes:
		var buttonNo = get_node_or_null("../" + buttonFalse)
		if buttonNo:
			buttonNo.visible = show
			buttonYes.visible = show
	else:
		buttonYes = get_node_or_null(buttonTrue)
		if buttonYes:
			var buttonNo = get_node_or_null(buttonFalse)
			if buttonNo:
				buttonNo.visible = show
				buttonYes.visible = show



func show_buttons(buttonTrue: String, buttonFalse: String) -> void:
	_toggle_buttons(true, buttonTrue, buttonFalse)

func hide_buttons(buttonTrue: String, buttonFalse: String) -> void:
	_toggle_buttons(false, buttonTrue, buttonFalse)
