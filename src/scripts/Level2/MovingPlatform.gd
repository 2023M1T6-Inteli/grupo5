extends KinematicBody2D

export var speed = 10
export var horizontal = true
export var distance = 600
export var waitDuration = 1.0

onready var initialPosition = position


func startTween():
	var targetPosition = initialPosition

	if horizontal:
		targetPosition += Vector2.RIGHT*distance
	else:
		targetPosition += Vector2.UP*distance

	var duration = (targetPosition-initialPosition).length() / float(speed * 16)

	$Tween.interpolate_property(
		self,
		'position',
		initialPosition,
		targetPosition,
		duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		waitDuration
	)

	$Tween.interpolate_property(
		self,
		'position',
		targetPosition,
		initialPosition,
		duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		duration + waitDuration*2
	)

	$Tween.start()


func _ready():
	startTween()
