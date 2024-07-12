extends Node2D

var enemigo_robot = preload("res://scenes/Enemigo.tscn")
var Torre = preload("res://scenes/Torrre.tscn")
var nexlevel = preload("res://scenes/ControlNivel.tscn")
var pausaSalir = preload("res://scenes/pausasalir.tscn")

var nenemigos = 2*Global.nivel #cantidad de enemigos dependiendo del nivel
var enemigosvivos=0
var contar_enemigos =false
func _process(delta):
	cantidaenemigos() #devuelve la cantidad de enemigos vivos

func _physics_process(delta):
	pass

func cantidaenemigos():
	var cant_enemigos = $Camino
	if contar_enemigos == true:
		for ene in cant_enemigos.get_children():
			enemigosvivos+=1
		if enemigosvivos ==0:
			$siguientenivel.visible=true
		print("vivos ",enemigosvivos)
		enemigosvivos=0
func _on_numero_enemigo_timeout():
	print('creando enemigo')
	if nenemigos>0:
		_enemigo()
		nenemigos-=1
		contar_enemigos = false #deshabilita contar los enemigos vivos
	if nenemigos<=0:
		$numero_enemigo.stop() #detiene el reloj, cuando se creo todos los enemigos
		contar_enemigos = true #habilita contar los enemigos
func _enemigo(): #permite crear al enemigo
	var pos = $Camino
	var enemigo = enemigo_robot.instance()
	enemigo.global_position = Vector2(pos.global_position.x, pos.global_position.y)
	get_node("Camino").add_child(enemigo)

func _on_btnCrear_pressed(): #crea la torre
	var torre = Torre.instance()
	torre.global_position=get_global_mouse_position()
	add_child(torre)
	print("Torre creada")


func _on_nivel_timeout(): #
	if nenemigos>0:
		_on_numero_enemigo_timeout()
	
		


func _on_Button_pressed():
	Global.nivel+=1
	nenemigos = 2*Global.nivel
	Global.vidarobot+=7
	Global.quitarvida+=1
	$siguientenivel.visible=false
	contar_enemigos = false
	print("Aumento nivel")
	


func _on_muro_area_entered(area):
	if area.is_in_group("Enemigo"):
		get_tree().reload_current_scene()


func _on_TextureButton_pressed():
	print("pausa")
	if Global.botonpausa: #crea el menu si el boton de pausa esta activado
		get_tree().paused=true
		var menu = pausaSalir.instance()
		var	pos = get_viewport().get_size_override()
		
		add_child(menu)
		Global.botonpausa=false #desactiva el boton de pausa
	
