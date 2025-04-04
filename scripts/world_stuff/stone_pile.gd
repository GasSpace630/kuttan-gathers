extends StaticBody2D

var stored_stone := 10
var stored_rock := 50
var stone_pile_destroyed : bool
@onready var timer: Timer = $Timer


func stone_pile_timeout():
	if stone_pile_destroyed:
		$detector.monitoring = false
		$Sprite2D.hide()
		$Sprite2D2.show()
		timer.start()

func _on_timer_timeout() -> void:
		stone_pile_destroyed = false
		$detector.monitoring = true
		$Sprite2D.show()
		$Sprite2D2.hide()

func _on_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = "stone"
		Mainstuff.resource_name = "stone pile"
		Mainstuff.sub_item_name = "rock"


func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = ""
		Mainstuff.resource_name = ""
		Mainstuff.sub_item_name = ""
		Mainstuff.clt_prgs = 0
		Mainstuff.sub_clt_prgs = 0


func stone_pile():
	pass
