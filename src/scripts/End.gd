extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ranking_pressed():
	return get_tree().change_scene("res://scenes/Ranking.tscn")


func _on_Menu_pressed():
	return get_tree().change_scene('res://scenes/Main.tscn')


func _on_Credits_pressed():
	return get_tree().change_scene('res://scenes/Credits.tscn')
