extends Area2D

export (String) var PPEName = 'boot'
export var storePositionX = -600
export var storePositionY = -200

# essa função inicia a flutuação do objeto
func _ready():
	$Animation.play('Float')
	$Sprite.texture = load('res://assets/PPE/' + PPEName + '.png')


# essa função verifica se o personagem está entrando em contato com a bota
func _on_body_entered(body):
	if body.name == 'Player':
		# para a animação e adiciona o item ao inventário
		$Animation.seek(0.5, true)
		$Animation.stop()
		body.PPEs.append(PPEName)
		position.x = storePositionX
		position.y = storePositionY
