extends TextureButton

var woodCounter = 2


func _on_WoodBox_pressed():
	if $"..".palletSelected:
		return

	if woodCounter < 0:
		return

	var newWood = load('res://scenes/Minigames/Pallets/PalletWood.tscn')
	newWood = newWood.instance()
	newWood.position = get_global_mouse_position()
	newWood.selected = true
	get_parent().add_child_below_node($"../FixedWood4", newWood)
	texture_normal = load('res://assets/minigames/woodBox/' + str(woodCounter) + '.png')
	woodCounter -= 1

	$"..".palletSelected = newWood
