extends Node2D  # o cualquier otro nodo

func _ready():
	# Forma simple de crear un diccionario
	var mi_dict = {"nombre": "Juan", "edad": 30}
	print(mi_dict)

	# Usando la clase Dictionary
	var otro_dict = Dictionary()
	otro_dict["nombre"] = "María"
	otro_dict["edad"] = 25
	print(otro_dict)

