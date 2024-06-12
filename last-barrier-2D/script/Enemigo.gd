extends PathFollow2D

export (float) var speed =200


func _process(delta):
	move(delta)

func move(delta):
	set_offset(get_offset() + speed * delta)
