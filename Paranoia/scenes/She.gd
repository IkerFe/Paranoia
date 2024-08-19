extends Control

# Array con los diálogos
var dialogue = [
	"FirstDialogue1",
	"FirstDialogue1.1",
	"FirstDialogue1.2",
	"FirstDialogue1.3",
	"FirstDialogue1.4",
	"FirstDialogue1.5",
]

# Índice del diálogo actual
var numActualDialogue = 0

# Referencia al Label que mostrará el diálogo
@onready var dialogueProtagonist = $Dialogue

func _ready():
	# Mostrar el primer diálogo al inicio
	dialogueProtagonist.text = dialogue[numActualDialogue]

# Función que se ejecuta cuando detecta una entrada táctil o clic
func _input(event):
	if event.is_pressed() and (event is InputEventMouseButton or event is InputEventScreenTouch):
		avanzar_dialogo()

# Función para avanzar el diálogo
func avanzar_dialogo():
	# Aumentar el índice del diálogo actual
	numActualDialogue += 1
	
	# Si hay más diálogos disponibles, actualiza el texto
	if numActualDialogue < dialogue.size():
		dialogueProtagonist.text = dialogue[numActualDialogue]
	else:
		# Si se acabaron los diálogos, puedes decidir qué hacer, como cerrar la ventana o reiniciar el diálogo.
		print("Diálogos terminados.")
		queue_free()  # O destruir la escena de diálogo

