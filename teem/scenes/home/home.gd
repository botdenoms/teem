extends Control

var members = 2
var art = 0
var endless = false
var level = 1
var levels = [1,1,1,1]

func _ready():
	# initilie ui look
	ui_looks()

func ui_looks():
	# members number
	if members <= 2:
		$VBoxContainer/membersbar/prev.visible = false
	else:
		$VBoxContainer/membersbar/prev.visible = true
	# arts changes"VBoxContainer/membersbar2/Label"
	$VBoxContainer/membersbar2/Label.text = 'Art at ndex: ' + String(art)
	# mode changes
	if endless:
		$VBoxContainer/membersbar3/Label.text = 'ENDLESS'
		$VBoxContainer/levels.visible = false
	else:
		$VBoxContainer/membersbar3/Label.text = 'Levels'
		$VBoxContainer/levels.visible = true
		if level <= 1:
			$VBoxContainer/levels/prevlvl.visible = false
			$VBoxContainer/levels/Label.text = 'Level ' + String(level)
		elif len(levels) == level:
			$VBoxContainer/levels/prevlvl.visible = true
			$VBoxContainer/levels/Label.text = 'Level ' + String(level)
			$VBoxContainer/levels/nextlvl.visible = false
		else:
			$VBoxContainer/levels/prevlvl.visible = true
			$VBoxContainer/levels/Label.text = 'Level ' + String(level)
			$VBoxContainer/levels/nextlvl.visible = true

func _on_Button_pressed():
	State.team_number = members
	State.endless = endless
	State.team_art = art
	if endless:
		State.level = level
	var _err = get_tree().change_scene("res://scenes/levels/1/1.tscn")

func _on_next_pressed():
	members += 1
	$VBoxContainer/membersbar/Label.text = String(members)
	ui_looks()

func _on_prev_pressed():
	if members <= 2:
		members = 2
		return
	members -= 1
	$VBoxContainer/membersbar/Label.text = String(members)
	ui_looks()

func _on_prevart_pressed():
	if art <= 0:
		return
	art -= 1
	ui_looks()

func _on_nextart_pressed():
	art += 1
	ui_looks()

func _on_prevmode_pressed():
	endless = !endless
	ui_looks()

func _on_nextmode_pressed():
	endless = !endless
	ui_looks()

func _on_prevlvl_pressed():
	if level < 1:
		return
	level -= 1
	ui_looks()

func _on_nextlvl_pressed():
	if len(levels) == level:
		return
	level += 1
	ui_looks()

func _on_TextureButton_pressed():
	print('settings btn pressed')
