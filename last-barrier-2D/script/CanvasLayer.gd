extends CanvasLayer


func _process(delta):
	$Nivel.text = str("Nivel ",Global.nivel)
	$Nivel.add_color_override("font_color", Color(0, 0, 0)) #cambia de color la fuente

