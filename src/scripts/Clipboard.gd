extends Button


func _ready():
	var levelIndex = $"..".name.replace('Level', '')
	levelIndex = int(levelIndex)-1
	$LevelName.bbcode_text = '[center]' + Locales.levels[levelIndex] + '[/center]'


func _on_mouse_entered():
	$Animation.play('slideToScreen')


func _on_mouse_exited():
	$Animation.play_backwards('slideToScreen')
