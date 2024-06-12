extends Area2D

onready var Disparo = preload("res://scenes/Disparo.tscn")
var cooldown = true

func _physics_process(delta):
	disparar()
	
	
func disparar():
	if cooldown:
		cooldown=false
		$Timer.start() #espera un tiempo para disparar
		var instancia_disparo = Disparo.instance()
		instancia_disparo.position = $Position2D.position
		add_child(instancia_disparo)
	pass


func _on_Timer_timeout():
	cooldown = true
