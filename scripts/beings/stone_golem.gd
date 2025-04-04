extends CharacterBody2D

@export var speed : int
@export var health : int
@export var accel : float
@export var strength : int
@export var knockback_str : int

@onready var player = get_tree().get_first_node_in_group("player")
@onready var attack_box: Area2D = $attack_box
@onready var health_bar: ProgressBar = $ProgressBar
@onready var start_health : int = health

var direction
var player_targeted : bool
var attack : bool

func _physics_process(_delta: float) -> void:
	chasing()
	health_system()

func chasing():
	player = get_tree().get_first_node_in_group("player")
	var target_pos = player.position
	direction = (target_pos - position).normalized()
	if player_targeted:
		velocity = lerp(velocity , direction * speed , accel)
	else:
		velocity = lerp(velocity , Vector2.ZERO , accel)
	attack_box.rotation = velocity.angle()
	move_and_slide()

func health_system():
	if health_bar.value == start_health:
		health_bar.hide()
	else:
		health_bar.show()
	health_bar.max_value = start_health
	health_bar.value = health
	if health <= 0:
		Mainstuff.stonium += 1
		Mainstuff.stone += 1
		queue_free()

func attacking_stuff():
	Mainstuff.player_health -= strength
	var knockback_dir = player.position.direction_to(position)
	var knockback = knockback_dir * knockback_str * 10
	player.velocity -= knockback
	while attack == true:
		attack_box.monitoring = false
		player_targeted = false
		await get_tree().create_timer(1).timeout
		player_targeted = true
		attack_box.monitoring = true

func _on_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_targeted = true

func _on_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_targeted = false


func _on_attack_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		attack = true
		attacking_stuff()

func _on_attack_box_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		attack = false


func enemy():
	pass
