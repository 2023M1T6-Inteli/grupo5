extends Node2D


func _input(event):
	if (event.is_action_pressed('interact')):
		if get_tree().change_scene('res://scenes/Tutorial/ClipboardTutorial.tscn') != OK:
			print ('An unexpected error occured when trying to switch to next scene')


func _on_Back_pressed():
	if get_tree().change_scene('res://scenes/Tutorial/Tutorial.tscn') != OK:
		print ('An unexpected error occured when trying to switch to next scene')


func _on_Next_pressed():
	if get_tree().change_scene('res://scenes/Tutorial/ClipboardTutorial.tscn') != OK:
		print ('An unexpected error occured when trying to switch to next scene')


func _ready():
	$Sprite/AnimationPlayer.play('InteractionChemical')
	$Sprite2/AnimationPlayer.play('animation-box')
