extends Area2D

# Está função verifica se o corpo do personagem está entrando em contato com o capacete. # Gabriel de Macedo
func on_body_entered(body):
	if body.is_in_group("Player_cap_epi"):
		body.cap_epi = true
		queue_free()
