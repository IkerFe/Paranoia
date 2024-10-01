extends Node  

@export var text: RichTextLabel
@export var insertText: LineEdit

var texto_guardado: String = ""

func _ready():
	insertText.max_length = 33
	match Global.OrderDialogue:
		1:
			Global.Dialogue = [
				"NameSelector1",
			]
	Global.update_dialogue_text(text)
	# Conecta la señal `text_submitted` en lugar de `text_entered`
	insertText.connect("text_submitted", Callable(self, "pressEnter"))

func pressEnter(nuevo_texto: String) -> void:
	texto_guardado = nuevo_texto
	print("textCorrect", texto_guardado)
	hidePlayerInsertText()
	var textProta = $"../TextProta"
	textProta.protagonistTextAppear()

func showPlayerInsertText():
	insertText.visible = true;
	text.visible = true;

func hidePlayerInsertText():
	insertText.visible = false;
	text.visible = false;

