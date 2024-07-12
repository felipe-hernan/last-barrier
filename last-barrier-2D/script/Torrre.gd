extends Node2D


onready var ataque = preload("res://scenes/Ataque.tscn")

var shot = true
var construc = false
func _process(delta):
	_alerta()
	if construc ==true:
		self.set_global_position(get_global_mouse_position())
		print ('mouse')
	
func _alerta():
	if $area/area_vision.disabled:
		$area/area_vision.disabled= false
		shot=true

func _on_Timer_timeout():
	$area/area_vision.disabled= true
	#print("reloj")



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
			print(shot)
			
func _on_torre_input_event(viewport, event, shape_idx):
	
	if event.is_action_pressed('click'):
		construc =true
	if event.is_action_released('click'):
		construc = false
	
