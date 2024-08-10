extends Node

func _ready():
	var current_date = Time.get_datetime_from_system()  # Obtiene la fecha y hora del sistema
	var day = current_date.day  # Obtiene el día actual
	var month = current_date.month  # Obtiene el mes actual
	var year = current_date.year  # Obtiene el año actual

	print("Hoy es el día ", day, " del mes ", month, " del año ", year)
