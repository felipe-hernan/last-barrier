extends Area2D

onready var Disparo = preload("res://scenes/Disparo.tscn")
onready var ataque = preload("res://scenes/Ataque.tscn")

var shot = true
func _process(delta):
	_alerta()
	
func _alerta():
	if $area/area_vision.disabled:
		$area/area_vision.disabled= false
		shot=true

func _on_Timer_timeout():
	$area/area_vision.disabled= true



func _on_Area2D_area_entered(area):
	if shot:
		if area.is_in_group("Enemigo"):
			$canon.look_at(area.global_position)
			var b=ataque.instance()
			b.global_position=global_position
			b.global_rotation=$canon.global_rotation
			get_tree().current_scene.call_deferred("add_child",b)
			b.global_position=$canon/ca/Position2D.global_position
			shot = false
			
			
		
