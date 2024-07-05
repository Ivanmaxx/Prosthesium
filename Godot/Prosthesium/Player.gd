extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _animated_sprite = $AnimatedSprite2D	

func _ready():
	pass
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = - SPEED
		_animated_sprite.play("run")
		_animated_sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		_animated_sprite.flip_h = false
		_animated_sprite.play("run")
	
	if Input.is_anything_pressed() == false:
		_animated_sprite.play("idle")
		velocity.x = 0

	move_and_slide()
