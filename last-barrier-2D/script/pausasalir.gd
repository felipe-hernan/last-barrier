extends CanvasLayer




func _on_salir_pressed():
	get_tree().quit() #cierrra el juego


func _on_continuar_pressed():
	print("continuar")
	get_tree().paused=false #pausa el juego
	Global.botonpausa=true #activa el boton de pausa
	queue_free() #elimina el menu de opciones
