extends Area2D

export (String) var PPEName = 'boot'


func _on_body_entered(body):
	if body.name == 'Player':
		# para a animação se o player entrar em contato com o EPI
		$Animation.seek(0.5, true)
		$Animation.stop()
		# adiciona o EPI ao inventário
		body.PPEs.append(PPEName)
		# destrói o EPI
		queue_free()


func _ready():
	# inicia a animação de flutuação
	$Animation.play('Float')
	# carrega a imagem de acordo com o nome do EPI
	$Sprite.texture = load('res://assets/PPE/' + PPEName + '.png')
