extends Control

@onready var player = get_tree().get_first_node_in_group("player")
@onready var build_name: Label = $Panel/VBoxContainer/build_name
@onready var respi_lbl: Label = $Panel/VBoxContainer/respi_lbl

var current_build : String
var current_respi : String
var repair_body


func _process(_delta: float) -> void:
	show_build()

func _on_repair_btn_pressed() -> void:
	repairing()

func show_build():
	if Mainstuff.resource_name == "ruin":
		var repair_bodies = player.attack_box.get_overlapping_bodies()
		if repair_bodies.is_empty() != true:
			repair_body = repair_bodies.front()
			player.attack_box.show()
			if repair_body.has_method("repair"):
				if repair_body.build_name == "staircase":
					current_build = "Stairs"
					current_respi = """wood : 20"""
				if repair_body.build_name == "workbench":
					current_build = "Stairs"
					current_respi = """wood : 5
					grass rope : 4"""
			else:
				pass
	else:
		pass
		
	build_name.text = current_build
	respi_lbl.text = current_respi

func repairing():    # Fixing stuff
	if Mainstuff.resource_name == "ruin" and repair_body.is_in_group("ruin"):
		player.attack_box.show()
		if repair_body.build_name == "staircase" and Mainstuff.wood >= 20:
			Mainstuff.wood -= 20
			repair_body.repair()
			$AudioStreamPlayer2D.play()
		if repair_body.build_name == "workbench" and Mainstuff.wood >= 5 and Mainstuff.grass_rope >= 4:
			Mainstuff.wood -= 5
			Mainstuff.grass_rope -= 4
			repair_body.repair()
			$AudioStreamPlayer2D.play()
		else:
			print("unable to repair")
