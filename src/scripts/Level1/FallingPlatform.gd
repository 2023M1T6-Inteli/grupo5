extends StaticBody2D

var animationPlaying = false

func _ready():
	$Animation.play("RESET")


func fall():
	$Animation.play("fall")
	animationPlaying = true


func _on_animation_finished(anim_name):
	$Timer.start()
	yield($Timer, 'timeout')

	$Animation.play("RESET")
	animationPlaying = false
