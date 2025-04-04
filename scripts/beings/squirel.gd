extends CharacterBody2D

@export var health : int
@export var speed :int
@export var accel : float

@onready var player = get_tree().get_first_node_in_group("player")
@onready var health_bar: ProgressBar = $ProgressBar
@onready var start_health : int = health

enum states{
	IDEL,
	ROAMING,
	RUNNING
}

var running_away : bool

func _process(_delta: float) -> void:
	health_system()
	move()

func move():
	var current_pos = position
	var player_pos = player.position
	var move_pos = -(player_pos - current_pos).normalized()
	if running_away == true:
		velocity = lerp(velocity , move_pos * speed , accel)
	else:
		velocity = lerp(velocity , Vector2.ZERO , accel)
	move_and_slide()

func health_system():
	if health_bar.value == start_health:
		health_bar.hide()
	else:
		health_bar.show()
	health_bar.max_value = start_health
	health_bar.value = health
	if health <= 0:
		Mainstuff.squirel_meat += 1
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		running_away = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		running_away = false
