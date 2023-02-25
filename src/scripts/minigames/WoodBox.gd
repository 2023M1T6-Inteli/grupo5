extends TextureButton

# contador de quantas madeiras estão disponíveis
var woodCounter = 2


func _on_WoodBox_pressed():
	if $"..".woodSelected:
		# se já tem uma madeira selecionado, retorna
		return

	if woodCounter < 0:
		# se não tem mais madeiras na caixa, retorna
		return

	# carrega uma nova madeira na cena
	var newWood = load('res://scenes/Minigames/Pallets/PalletWood.tscn')
	newWood = newWood.instance()
	newWood.position = get_global_mouse_position()
	get_parent().add_child_below_node($"../FixedWood4", newWood)
	
	# carrega a textura de acordo com a quantidade de madeiras
	texture_normal = load('res://assets/minigames/woodBox/' + str(woodCounter) + '.png')
	woodCounter -= 1

	# atualiza a madeira selecionada
	$"..".woodSelected = newWood
	# indica que a madeira está selecionada
	newWood.selected = true
