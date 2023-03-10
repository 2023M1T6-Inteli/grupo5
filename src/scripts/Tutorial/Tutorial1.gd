extends Node2D


func _input(event):
	# passa de cena com os botões de interação
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
	# roda as animações dos gifs de tutorial
	$Sprite/AnimationPlayer.play('InteractionChemical')
	$Sprite2/AnimationPlayer.play('animation-box')
	var nodeCounter = 0
	for node in get_children():
		if not node.is_in_group('TutorialText'):
			continue

		node.text = Locales.tutorial.get('Interactions')[nodeCounter]
		nodeCounter += 1
