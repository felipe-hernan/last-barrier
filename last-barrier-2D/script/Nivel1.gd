extends Node2D

var enemigo_robot = preload("res://scenes/Enemigo.tscn")
var Torre = preload("res://scenes/Torrre.tscn")

var nenemigos = 3*Global.nivel #cantidad de enemigos dependiendo del nivel
func _process(delta):
	pass

func _physics_process(delta):
	pass




func _on_numero_enemigo_timeout():
	print('creando enemigo')
	if nenemigos>0:
		_enemigo()
		nenemigos-=1
	if nenemigos<=0:
		$numero_enemigo.stop() #detiene el reloj, cuando se creo todos los enemigos

func _enemigo(): #permite crear al enemigo
	var pos = $Camino
	var enemigo = enemigo_robot.instance()
	enemigo.global_position = Vector2(pos.global_position.x, pos.global_position.y)
	get_node("Camino").add_child(enemigo)

func _on_btnCrear_pressed():
	var torre = Torre.instance()
	torre.global_position=get_global_mouse_position()
	add_child(torre)
	print("Torre creada")


func _on_nivel_timeout(): #
	if nenemigos>0:
		_on_numero_enemigo_timeout()
	
		


func _on_Button_pressed():
	Global.nivel+=1
	nenemigos = 3*Global.nivel
	Global.vidarobot+=5
	print("Aumento nivel")
	
