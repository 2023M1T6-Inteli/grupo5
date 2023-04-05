extends Node2D


func _on_Animation_animation_finished(_run):
	if get_tree().change_scene('res://scenes/Main.tscn') != OK:
		print ('An unexpected error occured when trying to switch to main scene')


func _ready():
	Music.change('Credits')
	$Animation.play('run')
	$Texts/Title.text = Locales.others.credits.title
	$Texts/Especifications.text = Locales.others.credits.especifications
