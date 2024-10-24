extends Area2D

var entered = false

func _on_area_entered(area: Area2D):
	entered = true
	print("ABOBA")

func _on_area_exited(area: Area2D):
	entered = false
	print("ABOBA")

func _physics_process(delta: float):
	if entered == true:
		print("ABOBA")
