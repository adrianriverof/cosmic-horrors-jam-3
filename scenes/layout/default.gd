extends Spatial


var from = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	match from:
		0:
			pass
		1:
			$player.transform = $playerspawn1.transform
			$compa.transform = $compaspawn1.transform
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	if body.name == $player.name:
		print("player entra")
		
		#print(get_parent())
		#print(get_parent().get_parent())
		get_parent().get_parent().change_room_from_to(2,1)