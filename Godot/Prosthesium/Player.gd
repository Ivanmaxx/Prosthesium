extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = 500

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_attack = true
var hitbox = null
var if_has_key = false
@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			jump()
	if Input.is_action_just_released("ui_accept"):
		jump_cut()
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		_animated_sprite.play("run")
		_animated_sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		_animated_sprite.flip_h = false
		_animated_sprite.play("run")
	if Input.is_action_pressed("hand_action_1") and can_attack:
		_animated_sprite.play("punch")
		can_attack = false
		'''if hitbox.is_colliding():
			for i in hitbox.get_colliders():
				if i.is_in_group("Enemies"):
					i.take_damage(20)'''
	
	if (not Input.is_action_pressed("ui_left")) and (not Input.is_action_pressed("ui_right")):
		velocity.x = 0
		can_attack = true
		
	if Input.is_anything_pressed() == false:
		_animated_sprite.play("idle")
	
	if velocity.length() > 0:
		move_and_slide()

func jump():
	velocity.y = -JUMP_VELOCITY
	
func jump_cut():
	if velocity.y < -150:
		velocity.y = -150
