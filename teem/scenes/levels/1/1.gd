extends Node2D

var player = preload("res://characters/square.tscn")
onready var parts = get_node("Particles2D")

func _ready():
	setup()

func setup():
	match State.get_team():
		2:
			for i in range(2):
				var inst = player.instance()
				var at = Vector2.ZERO
				match i:
					0:
						at.x = -50
					1:
						at.x = 50
				inst.position = at
				inst.connect("explode", parts, '_on_square_explode')
				get_node("team").add_child(inst)
		3:
			for i in range(3):
				var inst = player.instance()
				var at = Vector2.ZERO
				match i:
					0:
						at.x = -100
					2:
						at.x = 100
				inst.position = at
				inst.connect("explode", parts, '_on_square_explode')
				get_node("team").add_child(inst)
		4:
			for i in range(4):
				var inst = player.instance()
				var at = Vector2.ZERO
				match i:
					0:
						at.x = -150
					1:
						at.x = -50
					2:
						at.x = 50
					3:
						at.x = 150
				inst.position = at
				inst.connect("explode", parts, '_on_square_explode')
				get_node("team").add_child(inst)
		5:
			for i in range(5):
				var inst = player.instance()
				var at = Vector2.ZERO
				match i:
					0:
						at.x = -200
					1:
						at.x = -100
					2:
						at.x = 0
					3:
						at.x = 100
					4:
						at.x = 200
				inst.position = at
				inst.connect("explode", parts, '_on_square_explode')
				get_node("team").add_child(inst)
