extends RigidBody2D

var long_grass_destroyed : bool
var stored_grass_fiber := 2
@onready var timer: Timer = $Timer


func _on_timer_timeout() -> void:
	long_grass_destroyed = false
	$Area2D.monitoring = true
	$Sprite2D.show()
	$Sprite2D2.hide()

func long_grass_timeout():
	if long_grass_destroyed:
		$Area2D.monitoring = false
		$Sprite2D.hide()
		$Sprite2D2.show()
		timer.start()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = "grass fiber"
		Mainstuff.resource_name = "long grass"
		Mainstuff.sub_item_name = ""


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = ""
		Mainstuff.resource_name = ""
		Mainstuff.sub_item_name = ""
		Mainstuff.clt_prgs = 0


func long_grass():
	pass
