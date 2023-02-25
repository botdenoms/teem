extends Node2D

func _process(_delta):
	check_status()

func check_status():
	var members = get_children()
	if members.size() == 0:
		var _err = get_tree().reload_current_scene()
	else:
		pass
