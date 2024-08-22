extends Control

var current_language = "es"

func _ready():
	# Conecta los botones para cambiar el idioma usando Callable
	$Button_English.connect("pressed", Callable(self, "_on_english_button_pressed"))
	$Button_Spanish.connect("pressed", Callable(self, "_on_spanish_button_pressed"))

func _on_english_button_pressed():
	current_language = "en"
	change_language()

func _on_spanish_button_pressed():
	current_language = "es"
	change_language()

func change_language():
	TranslationServer.set_locale(current_language)

