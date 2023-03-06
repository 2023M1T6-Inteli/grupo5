extends Area2D





func _on_Parking_body_entered(body):
	if body.name == 'Empilhadeira':
		$TracejadoBranco.visible = true

func _on_Parking_body_exited(body):
	if body.name =="Empilhadeira":
		$TracejadoBranco.visible = false
	
	
