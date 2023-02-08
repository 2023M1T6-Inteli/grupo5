extends Area2D

# Está função verifica se o personagem está entrando em contato com a bota. # Gabriel de Macedo
func on_body_entered(body):
	if body.is_in_group("Player"):
		body.epi = true
		queue_free()
	
