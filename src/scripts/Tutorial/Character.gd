extends Node2D


func _on_Bia_mouse_entered():
	# função que junto com a exited simula o hover, e muda o sprite o icone
	$Bia.icon = load('res://assets/Character/BiaSelected.png')
	$Bia.rect_position = Vector2(145, 144)


func _on_Bia_mouse_exited():
	$Bia.icon = load('res://assets/Character/Bia.png')
	$Bia.rect_position = Vector2(140, 159)


func _on_Bia_pressed():
	# função para passar para a próxima tela do tutorial ao clicar no personagem
	Global.characterName = 'Beatriz'
	if get_tree().change_scene('res://scenes/Tutorial/Tutorial.tscn') != OK:
		print ('An unexpected error occured when trying to switch to next scene')


func _on_Gabriel_mouse_entered():
	$Gabriel.icon = load('res://assets/Character/GabrielSelected.png')
	$Gabriel.rect_position = Vector2(689, 151)


func _on_Gabriel_mouse_exited():
	$Gabriel.icon = load('res://assets/Character/Gabriel.png')
	$Gabriel.rect_position = Vector2(700, 162)


func _on_Gabriel_pressed():
	Global.characterName = 'Gabriel'
	if get_tree().change_scene('res://scenes/Tutorial/Tutorial.tscn') != OK:
		print ('An unexpected error occured when trying to switch to next scene')


func _ready():
	# atualiza todos os textos da tela
	var nodeCounter = 0
	for node in get_children():
		if not node.is_in_group('TutorialText'):
			continue

		node.text = Locales.tutorial.get('Character')[nodeCounter]
		nodeCounter += 1
