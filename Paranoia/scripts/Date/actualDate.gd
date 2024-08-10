extends Node

func _ready():
	# Obtener la fecha y hora actual usando Time
	var now = Time.get_time_dict_from_system()

	# Extraer el día, mes y año
	var day = now["day"]
	var month = now["month"]
	var year = now["year"]

	# Mostrar la fecha en la consola
	print("Día: %d" % day)
	print("Mes: %d" % month)
	print("Año: %d" % year)
