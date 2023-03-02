extends AudioStreamPlayer

onready var tween = $Tween
var minVolume = -80
var volume = -15

var currentMusic = 'Main'
var fadingOut = false

var musics = {
	'Main' : load("res://assets/sounds/music/8bit_lets_go.ogg"),
	'Level1' : load("res://assets/sounds/music/8bit_move.ogg")
}

func fadeIn():
	tween.interpolate_property(
		self, 
		'volume_db', 
		minVolume, 
		volume, 
		3, 
		Tween.TRANS_LINEAR, 
		Tween.EASE_IN
	)
	tween.start()


func fadeOut():
	tween.interpolate_property(
		self, 
		'volume_db', 
		volume, 
		minVolume, 
		1.2, 
		Tween.TRANS_LINEAR, 
		Tween.EASE_IN
	)
	tween.start()


func _on_Tween_tween_completed(_object, _key):
	# espera o fadeout acabar para iniciar o fadein da próxima música
	if !fadingOut:
		return
	#acessa o dicionário das musicas
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
