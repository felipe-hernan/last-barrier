extends Area2D

onready var Disparo = preload("res://scenes/Disparo.tscn")
var cooldown = true
var shot = true
func _process(delta):
	_alerta()
	
func disparo_enemigo():
	
	pass
	

func disparar(var areaenemigo):

	if cooldown:
		cooldown=false
		$Timer.start() #espera un tiempo para disparar
		var instancia_disparo = Disparo.instance()
		instancia_disparo.position = $canon/ca/Position2D.position
		#add_child(instancia_disparo)
			
		
func _alerta():
	if $area/area_vision.disabled:
		$area/area_vision.disabled= false
		shot=true

func _on_Timer_timeout():
	cooldown = true
	$area/area_vision.disabled= true



func _on_Area2D_area_entered(area):
	if shot:
		if area.is_in_group("Enemigo"):
			get_node("canon").look_at(area.global_position)
			disparar(area)
		
