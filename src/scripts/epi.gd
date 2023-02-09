extends Area2D

#Essa função inicia a flutuação do objeto
func _ready():
	$Animation.play('idle')

# Está função verifica se o personagem está entrando em contato com a bota
func on_body_entered(body):
	if body.is_in_group("Player"):
		body.epi = true
		position.x = -600
		position.y = -200
		$Animation.play('RESET')
		
	
