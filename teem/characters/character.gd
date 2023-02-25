extends KinematicBody2D

export(int, 1, 500) var speed = 20
export(int, 1, 500) var turn = 150
var velocity = Vector2.ZERO

signal explode(at)

func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity.y -= delta * speed
	if Input.is_action_just_pressed("ui_left"):
		velocity.x -= turn
	elif Input.is_action_just_pressed("ui_right"):
		velocity.x += turn
	else:
		if velocity.x < 0:
			velocity.x += speed
		elif velocity.x > 0:
			velocity.x -= speed
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_area_entered(area):
	if area.is_in_group('danger'):
		emit_signal("explode", position)
		queue_free()

func _on_Area2D_body_entered(body):
	if body.is_in_group('danger'):
		emit_signal("explode", position)
		queue_free()
