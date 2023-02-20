extends Button

# flag que indica que a prancheta está recuando
var closing = false


func _ready():
	# coleta o nome do nível de acordo com o node root
	var levelName = $"../..".name
	# atualiza o nome na prancheta
	$LevelName.bbcode_text = '[center]' + Locales.levels.get(levelName) + '[/center]'
	
	# atualiza todos os textos da prancheta de acordo com o nível
	var nodeCounter = 0
	for node in get_tree().get_nodes_in_group('LevelText'):
		node.bbcode_text = '[center]' + Locales.clipboard.get(levelName)[nodeCounter] + '[/center]'
		nodeCounter += 1


func _on_mouse_entered():
	# ao passar o mouse na prancheta, ela aparece na tela
	if $Animation.is_playing():
		# impede que as animações entrem em conflito
		return

	# esconde o botão de interação
	get_parent().get_node("Gamepad/interact").hide()
	# inicia a animação
	$Animation.play('slideToScreen')


func _on_mouse_exited():
	# ao tirar o mouse da prancheta, ela recua
	if $Animation.is_playing():
		# impede que as animações entrem em conflito
		return

	# inicia a animação ao contrário
	$Animation.play_backwards('slideToScreen')
	# atualiza a flag de recuo
	closing = true


func _on_Animation_animation_finished(_anim_name):
	if closing:
		# ao terminar a animação de recuo, mostra o botão de interação novamente
		get_parent().get_node("Gamepad/interact").show()

	# reseta a flag de recuo
	closing = false
