extends Area2D


#Essa função inicia a flutuação do objeto
func _ready():
	$Animation.play('idle')


# Está função verifica se o corpo do personagem está entrando em contato com o capacete
func on_body_entered(body):
	if body.name == 'player':
		body.cap_epi = true
		position.x = -600 
		position.y = -245
		$Animation.play('RESET')
