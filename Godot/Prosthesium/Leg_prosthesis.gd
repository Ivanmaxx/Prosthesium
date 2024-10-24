extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Are_body_entered():
	get_node("Sprite2D").visible = false
	get_node("CollisionShape2D").disabled = true
	$root/Playerstates.prostheses["leg"] = "basic"


func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		get_node("Sprite2D").visible = false
		get_node("CollisionShape2D").disabled = true
		$/root/Playerstates.prostheses["leg"] = "basic"
