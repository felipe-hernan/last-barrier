extends PathFollow2D

export (float) var speed =200

var vida = 1*Global.vidarobot

func _process(delta):
	move(delta)
	_vida()

func move(delta):
	offset+=speed*delta



func _on_Enemigo_area_entered(area):
	if area.is_in_group("proyectil"):
		vida-=1
		print(vida)

func _vida():
	if vida <=0:
		queue_free()
