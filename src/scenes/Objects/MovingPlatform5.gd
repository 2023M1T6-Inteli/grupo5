extends Node2D

onready var platform = $platform
onready var tween = $Tween

export var speed = 15
export var horizontal = true
export var distance = 200

const wait_duration = 1.0
 
func _ready():
	_start_tween()

func _start_tween(): 
	var _move_direction = Vector2.RIGHT * distance if horizontal else Vector2.UP * distance
	var duration = _move_direction.length() / float(speed * 16)
	tween.interpolate_property(
		platform, "position", Vector2.ZERO, _move_direction, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, wait_duration
	)
	
	tween.interpolate_property(
		platform, "position", _move_direction, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + wait_duration * 2
	)
	tween.start()
