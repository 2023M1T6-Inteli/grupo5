extends Area2D

func _on_npc_quimico_body_entered(body): # essa função detecta a entrada do player
	$Stroke.visible = true

func _on_npc_quimico_body_exited(body):
	$Stroke.visible = false
