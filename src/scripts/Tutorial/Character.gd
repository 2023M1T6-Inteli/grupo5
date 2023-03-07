extends Node2D


func _ready():
	pass


func _on_Bia_mouse_entered():
	$Bia.icon = load('res://assets/Character/BiaSelected.png')
	$Bia.rect_position = Vector2(145, 144)


func _on_Bia_mouse_exited():
	$Bia.icon = load('res://assets/Character/Bia.png')
	$Bia.rect_position = Vector2(140, 159)


func _on_Bia_pressed():
	Global.characterName = 'Beatriz'
	get_tree().change_scene("res://scenes/Level1.tscn")


func _on_Gabriel_mouse_entered():
	$Gabriel.icon = load("res://assets/Character/GabrielSelected.png")
	$Gabriel.rect_position = Vector2(689, 151)


func _on_Gabriel_mouse_exited():
	$Gabriel.icon = load("res://assets/Character/Gabriel.png")
	$Gabriel.rect_position = Vector2(700, 162)


func _on_Gabriel_pressed():
	Global.characterName = 'Gabriel'
	get_tree().change_scene("res://scenes/Level1.tscn")

