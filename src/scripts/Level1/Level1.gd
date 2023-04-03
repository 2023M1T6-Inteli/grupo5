extends Node2D


func canPlayMinigame():
	# força a permissão do player jogue o minigame sempre (TODO)
	return true


func _ready():
	# inicia a música do nível
	Music.change('Level1')
