extends Camera2D

func _process(_delta):
	# get number of team menbers
	var team = get_parent().get_node("team").get_child_count()
	if get_parent().get_node("team").get_child_count() == 0:
		return
	# mid child if odd & mid 2 avg if even
	if team % 2 == 1:
		var ply = get_parent().get_node("team").get_child(int(team/2)).get_global_transform().get_origin()
		position = ply
	else:
		var mid1 = get_parent().get_node("team").get_child(int(team/2) -1).get_global_transform().get_origin()
		var mid2 = get_parent().get_node("team").get_child(int(team/2)).get_global_transform().get_origin()
		var x = (mid1.x + mid2.x) / 2
		position.y = mid1.y
		position.x = x

