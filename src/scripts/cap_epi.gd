extends Area2D


# essa função inicia a flutuação do objeto
func _ready():
	$Animation.play('idle')


# essa função verifica se o corpo do personagem está entrando em contato com o capacete
func on_body_entered(body):
	if body.name == 'Player':
		body.cap_epi = true
		position.x = -600 
		position.y = -245
		$Animation.play('RESET')
