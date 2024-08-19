extends Control

var current_language = "es"

func _ready():
	# Conecta los botones para cambiar el idioma usando Callable
	$Button_English.connect("pressed", Callable(self, "_on_english_button_pressed"))
	$Button_Spanish.connect("pressed", Callable(self, "_on_spanish_button_pressed"))
	
	# Actualiza el texto inicial
	update_text()

func _on_english_button_pressed():
	current_language = "en"
	change_language()

func _on_spanish_button_pressed():
	current_language = "es"
	change_language()

func change_language():
	TranslationServer.set_locale(current_language)
	update_text()

func update_text():
	$Label.text = tr("Continue")  # Reemplaza "Your text here" con el texto que desees traducir

func _on_button_spanish_2_pressed():
	pass # Reemplaza con el cuerpo de la función
