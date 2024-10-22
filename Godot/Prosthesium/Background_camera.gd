extends AnimatedSprite2D


@onready var _animated_sprite = $/root/Node2D/AnimatedSprite2D17


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_animated_sprite.play("default")
