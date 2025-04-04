extends StaticBody2D

var stored_stick := 50
var stored_wood := 5
var tree_cutted : bool
@onready var timer: Timer = $Timer

func _on_timer_timeout() -> void:
	tree_cutted = false
	$detector.monitoring = true
	$Sprite2D2.hide()
	$Sprite2D.show()

func tree_timeout():
	if tree_cutted:
		$detector.monitoring = false
		$Sprite2D2.show()
		$Sprite2D.hide()
		timer.start()
		

func _on_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = "wood"
		Mainstuff.resource_name = "tree"
		Mainstuff.sub_item_name = "stick"


func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.item_name = ""
		Mainstuff.resource_name = ""
		Mainstuff.sub_item_name = ""
		Mainstuff.clt_prgs = 0
		Mainstuff.sub_clt_prgs = 0

func tree():
	pass
