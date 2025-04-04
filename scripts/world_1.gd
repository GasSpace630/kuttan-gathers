extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var layer_0: StaticBody2D = $barriers/layer0
@onready var layer_1: StaticBody2D = $barriers/layer1
@onready var layer_2: StaticBody2D = $barriers/layer2

func _process(delta: float) -> void:
	climbing_system()

func climbing_system():
	if player.z_index == -1:
		Mainstuff.player_layer0 = true
		layer_1.process_mode = Node.PROCESS_MODE_DISABLED
		layer_2.process_mode = Node.PROCESS_MODE_DISABLED
		layer_0.process_mode = Node.PROCESS_MODE_ALWAYS
	if player.z_index == 0:
		Mainstuff.player_layer1 = true
		layer_1.process_mode = Node.PROCESS_MODE_ALWAYS
		layer_2.process_mode = Node.PROCESS_MODE_DISABLED
		layer_0.process_mode = Node.PROCESS_MODE_DISABLED
	if player.z_index == 2:
		Mainstuff.player_layer2 = true
		layer_1.process_mode = Node.PROCESS_MODE_DISABLED
		layer_2.process_mode = Node.PROCESS_MODE_ALWAYS
		layer_0.process_mode = Node.PROCESS_MODE_DISABLED
