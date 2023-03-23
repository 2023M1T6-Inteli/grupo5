extends Node2D

var valveCounter = 0
var pvcReleased = false


func canPlayMinigame():
	return true


func _ready():
	$HUD/Clipboard.slideToScreen()



func _on_valveActivated():
	if pvcReleased:
		return

	valveCounter += 1
	$valve_sfx.play()
	if valveCounter > 5:
		var tween = Tween.new()
		add_child(tween)
		tween.interpolate_property(
			$PVC,
			'position:y',
			-960,
			700,
			1,
			Tween.TRANS_SINE,
			Tween.EASE_IN_OUT
		)
		tween.start()
		pvcReleased = true
