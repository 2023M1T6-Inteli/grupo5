extends KinematicBody2D

export (int) var runSpeed = 500
export (int) var jumpSpeed = -1250
export (int) var gravity = 3000

var PPEs = []
var midAir = false
var velocity = Vector2()


func canPlayMinigame():
	return (len(PPEs) >= 6)


func movePlayer():
	if Global.minigameRunning or $"../HUD/Dialog".visible:
		velocity = Vector2.ZERO
		return

	# interpreta os inputs de movimentação e aplica as velocidades	
	velocity.x = 0
	# recebe os inputs de movimentação
	var right = Input.is_action_pressed('move_right')
	var left = Input.is_action_pressed('move_left')
	var jump = Input.is_action_just_pressed('jump')

	# Verifica se o player está no ar para parar o som dos passos e permitir que haja o som de queda ao tocar no chão
	if midAir:
		$run_sound.stop()
		if is_on_floor():
			midAir = false
			$fall_sound.play()
	if !is_on_floor():
		midAir = true
	# aplica as velocidades de acordo com o movimento desejado
	if jump and is_on_floor():
		velocity.y = jumpSpeed
		$jump_sound.play() 
	elif right: 
		velocity.x += runSpeed
		$Animation.play('run')
		$Sprite.flip_h = false 
	elif left:
		velocity.x -= runSpeed
		$Animation.play('run')
		$Sprite.flip_h = true
	else:
		$Animation.play("RESET")
	
			
			

			
			


func _physics_process(delta):
	# realiza a movimentação do player
	movePlayer()
	# calcula a velocidade em y de acordo com a gravidade
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
