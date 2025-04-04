extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = "Make something"
		Mainstuff.resource_name = "working bench"
		Mainstuff.sub_item_name = ""


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = ""
		Mainstuff.resource_name = ""
		Mainstuff.sub_item_name = ""
		Mainstuff.working = false


func working_bench():
	pass
