extends Spatial



var room_scenes = [
	preload("res://test scenes/layout/1.tscn"),
	preload("res://test scenes/layout/2.tscn"),
	preload("res://test scenes/layout/3.tscn")
	# Añadir más escenas aquí...
]


func change_room_from_to(from, to):
	print("venimos de la sala " + str(from) + " y vamos a la sala " + str(to))

	# Verificar que el valor de 'to' esté dentro del rango de las salas disponibles
	if to < 1 or to > room_scenes.size():
		print("Error: Sala destino fuera de rango")
		return

	# Instanciar la nueva sala basándote en el índice del array (ajustado por 'to - 1')
	var roomtoinstance = room_scenes[to - 1].instance()
	
	roomtoinstance.from = from

	# Elimina la sala actual
	get_node("RoomManager").get_child(0).queue_free()
	
	# Añadir la nueva sala
	get_tree().get_root().get_node("general").get_node("RoomManager").add_child(roomtoinstance, true)

	