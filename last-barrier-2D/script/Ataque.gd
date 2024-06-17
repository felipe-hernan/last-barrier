extends Node2D

const RIGHT = Vector2.RIGHT
var velocidad: int = 20

func _physics_process(delta):
	var move = RIGHT.rotated(rotation)*velocidad
	global_position+=move


func _on_Area2D_area_entered(area):
	if area.is_in_group("Enemigo"):
		print("pow")
		queue_free() #se elimina el proyectil


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
