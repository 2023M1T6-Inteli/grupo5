extends Button

var closing = false


func _ready():
	var levelName = $"../..".name
	$LevelName.bbcode_text = '[center]' + Locales.levels.get(levelName) + '[/center]'
	var nodeCounter = 0
	for node in get_tree().get_nodes_in_group('LevelText'):
		node.bbcode_text = '[center]' + Locales.clipboard.get(levelName)[nodeCounter] + '[/center]'
		nodeCounter += 1


func _on_mouse_entered():
	if $Animation.is_playing():
		return

	get_parent().get_node("Gamepad/interact").hide()
	$Animation.play('slideToScreen')


func _on_mouse_exited():
	if $Animation.is_playing():
		return

	$Animation.play_backwards('slideToScreen')
	closing = true


func _on_Animation_animation_finished(_anim_name):
	if closing:
		get_parent().get_node("Gamepad/interact").show()

	closing = false
