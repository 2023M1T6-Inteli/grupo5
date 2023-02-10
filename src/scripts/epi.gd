extends Area2D


# essa função inicia a flutuação do objeto
func _ready():
	$Animation.play('idle')


# essa função verifica se o personagem está entrando em contato com a bota
func on_body_entered(body):
	if body.name == 'Player':
		body.epi = true
		position.x = -600
		position.y = -200
		$Animation.play('RESET')
