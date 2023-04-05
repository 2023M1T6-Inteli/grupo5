extends Node2D


func _ready():
	$Title2.text = Locales.others.end.title
	$Title2/Subtitle.text = Locales.others.end.subtitle
	$Credits.text = Locales.others.end.credits


func _on_Ranking_pressed():
	return get_tree().change_scene("res://scenes/Ranking.tscn")


func _on_Menu_pressed():
	return get_tree().change_scene('res://scenes/Main.tscn')


func _on_Credits_pressed():
	return get_tree().change_scene('res://scenes/Credits.tscn')
