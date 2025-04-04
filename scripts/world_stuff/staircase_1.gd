extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void: #up
	if body.is_in_group("player"):
		if Mainstuff.player_layer2 == true:
			body.z_index = 0
		if Mainstuff.player_layer1 == true:
			body.z_index = 2

func _on_area_2d_2_body_entered(body: Node2D) -> void: #down
	if body.is_in_group("player"): 
		if Mainstuff.player_layer2 == true:
			body.z_index = 0
		if Mainstuff.player_layer1 == true:
			body.z_index = 0

func staircase():
	pass
