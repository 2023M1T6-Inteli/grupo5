extends Button

var closing = false


func _ready():
	var levelName = $"../..".name
	$LevelName.bbcode_text = '[center]' + Locales.levels.get(levelName) + '[/center]'


func _on_mouse_entered():
	get_parent().get_node("Gamepad/interact").hide()
	$Animation.play('slideToScreen')


func _on_mouse_exited():
	$Animation.play_backwards('slideToScreen')
	closing = true


func _on_Animation_animation_finished(_anim_name):
	print(_anim_name)
	if closing:
		get_parent().get_node("Gamepad/interact").show()

	closing = false
