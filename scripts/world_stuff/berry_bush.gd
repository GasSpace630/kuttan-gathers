extends StaticBody2D

var stored_red_berry := 5
var berry_bush_destroyed : bool
@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	berry_bush_destroyed = false
	$Area2D.monitoring = true
	$Sprite2D2.hide()
	$Sprite2D.show()

func berry_bush_timeout():
	if berry_bush_destroyed:
		$Area2D.monitoring = false
		$Sprite2D2.show()
		$Sprite2D.hide()
		timer.start()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = "berry"
		Mainstuff.resource_name = "berry bush"


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = ""
		Mainstuff.resource_name = ""
		Mainstuff.sub_item_name = ""
		Mainstuff.clt_prgs = 0
		Mainstuff.sub_clt_prgs = 0


func berry_bush():
	pass
