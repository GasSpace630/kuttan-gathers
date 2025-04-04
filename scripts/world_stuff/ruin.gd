extends StaticBody2D

@export var build_name : String
@export var construct : PackedScene
@export var sprite : Texture2D

@onready var Ruin : CollisionShape2D = $CollisionShape2D
@onready var ruin_texture : Sprite2D =$CollisionShape2D/Sprite2D

func _ready() -> void:
	ruin_texture.texture = sprite

func repair():
	var construction = construct.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	add_child(construction)
	Ruin.queue_free()
	Ruin.disabled = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.resource_name = "ruin"
		Mainstuff.item_name = "REPAIR"

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Mainstuff.building = false
		Mainstuff.item_name = ""
		Mainstuff.resource_name = ""
		Mainstuff.sub_item_name = ""
		Mainstuff.clt_prgs = 0
		Mainstuff.sub_clt_prgs = 0


func ruin():
	pass
