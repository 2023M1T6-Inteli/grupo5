extends AudioStreamPlayer

var minVolume = -80

var currentMusic = 'Main'
var fadingOut = false

var musics = {
	'Main' : preload("res://assets/Sounds/Music/8bit_lets_go.ogg"),
	'Level1' : preload("res://assets/Sounds/Music/8bit_move.ogg")
}


func fadeIn():
	# chama o tween para executar a função de fade in da música
	$Tween.interpolate_property(
		self,
		'volume_db',
		minVolume,
		volume_db,
		1.0,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	$Tween.start()


func fadeOut():
	$Tween.interpolate_property(
		self,
		'volume_db',
		volume_db,
		minVolume,
		0.2,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	$Tween.start()


func _on_Tween_tween_completed(_object, _key):
	# espera o fadeout acabar para iniciar o fadein da próxima música
	if !fadingOut:
		return
	# acessa o dicionário das musicas
	stream  = musics[currentMusic]
	fadeIn()
	play()
	fadingOut = false


func change(name):
	fadeOut()
	currentMusic = name
	fadingOut = true


func _ready():
	fadeIn()
	play()
