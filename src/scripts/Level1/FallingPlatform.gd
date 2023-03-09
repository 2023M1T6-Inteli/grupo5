extends StaticBody2D

var animationPlaying = false
onready var initialPosition = position


func _ready():
	initialPosition = position


func reset():
	# reseta a posição do pallet após o tempo de retorno
	$Tween.interpolate_property(self, 'position:y', initialPosition.y+25, initialPosition.y, 0.2, $Tween.TRANS_LINEAR, $Tween.EASE_IN_OUT)
	$Tween.interpolate_property(self, "modulate:a", 0.0, 1.0, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func fall():
	animationPlaying = true

	# Tween o movimento horizontal para a esquerda
	$Tween.interpolate_property(self, "position:x", initialPosition.x, initialPosition.x - 10, 0.1, $Tween.TRANS_LINEAR, $Tween.EASE_IN_OUT)
	$Tween.interpolate_property(self, "position:x", initialPosition.x - 10, initialPosition.x + 10, 0.1, $Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.1)
	$Tween.interpolate_property(self, "position:x", initialPosition.x + 10, initialPosition.x - 10, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.2)
	$Tween.interpolate_property(self, "position:x", initialPosition.x - 10, initialPosition.x + 10, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.3)
	$Tween.interpolate_property(self, "position:x", initialPosition.x + 10, initialPosition.x - 10, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.4)

	# Tween da queda
	$Tween.interpolate_property(self, "position:y", initialPosition.y, initialPosition.y + 300, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.5)
	$Tween.interpolate_property(self, "modulate:a", 1.0, 0.0, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.5)

	# Inicia o Tween
	$Tween.start()
	
	yield($Tween, "tween_completed")
	$Timer.start()
	yield($Timer, 'timeout')
	reset()
	animationPlaying = false
