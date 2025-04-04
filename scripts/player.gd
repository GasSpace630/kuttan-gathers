extends CharacterBody2D

@onready var attack_box: Area2D = $attack_box
@onready var pl_anim: AnimatedSprite2D = $Sprite2D
@onready var walking_sfx: AudioStreamPlayer = $walking_sfx

var direction : Vector2
var walking : bool
var hitting_body
var attacking_bodies
var knockback_dir
var knockback

func _physics_process(_delta: float) -> void:
	move()
	attacking()
	health_system()

func move():
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = direction.normalized()
	velocity = lerp(velocity , direction * Mainstuff.player_speed , Mainstuff.player_accel)
	
	attack_box.rotation = velocity.angle()
	#attack_box.look_at(get_global_mouse_position())
	move_and_slide()
	
	if Input.is_action_pressed("move_right"):
		pl_anim.flip_h = false
		walking = true
		pl_anim.play("walking")
	elif Input.is_action_pressed("move_left"):
		pl_anim.flip_h = true
		walking = true
		pl_anim.play("walking")
	elif Input.is_action_pressed("move_up"):
		walking = true
		pl_anim.play("up_walking")
	elif Input.is_action_pressed("move_down"):
		walking = true
		pl_anim.play("down_walking")
	else:
		walking = false
		pl_anim.stop()
	
	#walking sound (needs work)
	if Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		walking_sfx.play()
	elif walking == false:
		walking_sfx.stop()
	else:
		pass

func attacking():
	attacking_bodies = attack_box.get_overlapping_bodies()
	if attacking_bodies.is_empty() != true:
		var attacking_body = attacking_bodies.front()
		if attacking_body.is_in_group("enemy") or attacking_body.is_in_group("animals") :
			hitting_body = attacking_body
			if Input.is_action_just_pressed(("attack")):
				$hitting_sfx.play()
				attack_box.show()
				$attack_box/ColorRect.set_color("ffffff52")
				knockback_dir = hitting_body.position.direction_to(position)
				knockback = knockback_dir * Mainstuff.player_kb_str * Mainstuff.player_kb_milti
				hitting_body.velocity = -knockback
				hitting_body.health -= Mainstuff.player_strength
		elif attacking_body.is_in_group("ruin") or attacking_body.is_in_group("interactable") :
			attack_box.show()
			$attack_box/ColorRect.set_color("ffffff52")
		else:
			$attack_box/ColorRect.set_color("ff000052")
	else:
		attack_box.hide()

func health_system():
	if Mainstuff.player_health != 100:
		if Mainstuff.red_berry >= 1 and Input.is_action_just_pressed("heal"):
			Mainstuff.red_berry -= 1
			Mainstuff.player_health += 10
	if Mainstuff.player_health <= 0:
		get_tree().quit()
