extends Node2D

var valveCounter = 0
var pvcReleased = false


func canPlayMinigame():
	# força a permissão do player jogue o minigame sempre (TODO)
	return true


func _ready():
	# mostra a prancheta
	$HUD/Clipboard.slideToScreen()


func _on_valveActivated():
	# quando a válvula é ativada, toca o som e incrementa o contador

	if pvcReleased:
		# se o PVC já foi liberado, não faz nada
		return

	valveCounter += 1
	$valve_sfx.play()

	if valveCounter > 5:
		# se o contador for maior que 5, libera o PVC
		var tween = Tween.new()
		add_child(tween)
		tween.interpolate_property(
			$PVC,
			'position:y',
			-1240,
			1000,
			5,
			Tween.TRANS_SINE,
			Tween.EASE_IN_OUT
		)
		tween.start()
		pvcReleased = true

	$'HUD/ValveCounter'.text = str(valveCounter)

	$'HUD/ValveCounter'.modulate = Color(0.95, 0.98, 0.04, 1)
	$'HUD/ValveLabel'.modulate = Color(0.95, 0.98, 0.04, 1)
	yield(get_tree().create_timer(0.5), 'timeout')
	$'HUD/ValveCounter'.modulate = Color(1, 1, 1, 1)
	$'HUD/ValveLabel'.modulate = Color(1, 1, 1, 1)
