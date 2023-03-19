extends Area2D


onready var imagem1 = $CollisionShape2D2/PhTape

func _ready():
	imagem1.set_visible(false)

func _on_Becker_1_area_entered(area):
	for i in range (1): #garante
		imagem1.set_visible(true)	#aparece a imagem do resultado do teste na fita de ph
		area.queue_free() #desaparece com a fita de ph que utilizamos para mover até o becker
		$CollisionShape2D.set_deferred("disabled", true ) #impede que a fita de ph já utilizada e agora invisivel interaja com outros beckers
		$CollisionShape2D2.set_deferred("disabled", true )
		PhGlobal.points += 1 #adiciona pontos ao minigame


func _on_Becker_2_area_entered(area):
	for i in range (1):
		imagem1.set_visible(true)
		area.queue_free()
		$CollisionShape2D.set_deferred("disabled", true )
		$CollisionShape2D2.set_deferred("disabled", true )
		PhGlobal.points += 1


func _on_Becker_3_area_entered(area):
	for i in range (1):
		imagem1.set_visible(true)
		area.queue_free()
		$CollisionShape2D.set_deferred("disabled", true )
		$CollisionShape2D2.set_deferred("disabled", true )
		PhGlobal.points += 1


func _on_Becker_4_area_entered(area):
	for i in range (1):
		imagem1.set_visible(true)
		area.queue_free()
		$CollisionShape2D.set_deferred("disabled", true )
		$CollisionShape2D2.set_deferred("disabled", true )
		PhGlobal.points += 1


func _on_Becker_5_area_entered(area):
	for i in range (1):
		imagem1.set_visible(true)
		area.queue_free()
		$CollisionShape2D.set_deferred("disabled", true )
		$CollisionShape2D2.set_deferred("disabled", true )
		PhGlobal.points += 1

func _on_Becker_6_area_entered(area):
	for i in range(1):
		imagem1.set_visible(true)
		area.queue_free()
		$CollisionShape2D.set_deferred("disabled", true )
		$CollisionShape2D2.set_deferred("disabled", true )
		PhGlobal.points += 1
		
