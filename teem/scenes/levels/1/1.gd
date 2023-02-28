extends Node2D

var player = preload("res://characters/square.tscn")
onready var parts = get_node("Particles2D")

func _ready():
	setup()

func setup():
	for i in range(State.get_team()):
		var inst = player.instance()
		var at = Vector2.ZERO
		at.x = 100 * i
		inst.position = at
		inst.connect("explode", parts, '_on_square_explode')
		get_node("team").add_child(inst)
