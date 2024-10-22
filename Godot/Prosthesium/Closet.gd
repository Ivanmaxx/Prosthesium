extends Area2D



@onready var _animated_sprite = $AnimatedSprite2D

func _ready():
	pass


func _process(delta):
	if _animated_sprite.frame == 1:
		_on_area_2d_body_entered($/root/Player)


func _on_area_2d_body_entered(body):
	if Input.is_action_pressed("item_use"):
		_animated_sprite.set_frame(0)
		body.set("if_has_key", true)
