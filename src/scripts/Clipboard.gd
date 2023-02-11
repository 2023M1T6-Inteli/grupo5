extends TextureButton


func _ready():
	pass # Replace with function body.


func _on_mouse_entered():
	$Animation.play('slideToScreen')


func _on_mouse_exited():
	$Animation.play_backwards('slideToScreen')
