extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.resource_name = "cave"
		Mainstuff.item_name = "Go inside"
		Mainstuff.exploring = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.resource_name = ""
		Mainstuff.item_name = ""
		Mainstuff.exploring = false

func cave():
	pass
