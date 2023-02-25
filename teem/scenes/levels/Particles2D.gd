extends Particles2D

func _on_square_explode(at):
	position = at
	position.y += 300
	emitting = true
