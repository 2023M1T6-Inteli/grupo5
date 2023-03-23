extends Area2D

export (String) var PPEName = 'boot'

var collecting = false


func _on_body_entered(body):
	if body.name == 'Player':
		# para a animação se o player entrar em contato com o EPI
		$Animation.seek(0.5, true)
		$Animation.stop()
		# adiciona o EPI ao inventário
		body.PPEs.append(PPEName)
		# chama a animação de coleta
		if !collecting:
			# a animação dá queue_free() no PPE ao finalizar
			$Animation.play('collect')
			$CollectSound.play()
			collecting = true


func _ready():
	# inicia a animação de flutuação
	$Animation.play('Float')
	# carrega a imagem de acordo com o nome do EPI
	$Sprite.texture = load('res://assets/PPE/' + PPEName + '.png')
