extends Area2D

export (String) var PPEName = 'boot'

func _ready():
	# inicia a animação de flutuação
	$Animation.play('Float')
	# carrega a imagem de acordo com o nome do EPI
	$Sprite.texture = load('res://assets/PPE/' + PPEName + '.png')


func _on_body_entered(body):
	if body.name == 'Player':
		# se o player entrar em contato com o EPI
		# para a animação
		$Animation.seek(0.5, true)
		$Animation.stop()
		# adiciona o EPI ao inventário
		body.PPEs.append(PPEName)
		# destrói o EPI
		queue_free()
