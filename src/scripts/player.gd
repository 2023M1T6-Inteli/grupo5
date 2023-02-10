extends KinematicBody2D

export (int) var run_speed = 300 
export (int) var jump_speed = -400 
export (int) var gravity = 1200 
onready var sprite = get_node('Sprite')
onready var animation = get_node('Animation')

# var epi recebe um valor bool false para que a função referenciada no script de epi mude tal valor e o personagem
# pegue a bota. 
var epi:bool = false
# var cap_epi recebe um valor bool false para que a função no script em cap_epi mude tal valor para true e o objeto suma
var cap_epi:bool = false

var velocity = Vector2()


func move_player():
	# interpreta os inputs de movimentação e aplica as velocidades	
	velocity.x = 0
	# recebe os inputs de movimentação
	var right = Input.is_action_pressed('move_right')
	var left = Input.is_action_pressed('move_left')
	var jump = Input.is_action_just_pressed('jump')

	# aplica as velocidades de acordo com o movimento desejado
	if jump and is_on_floor():
		velocity.y = jump_speed
	if right: 
		velocity.x += run_speed
		animation.play('run')
		sprite.flip_h = false 
	if left:
		velocity.x -= run_speed
		animation.play('run')
		sprite.flip_h = true


func _physics_process(delta):
	# realiza a movimentação do player
	move_player()
	# calcula a velocidade em y de acordo com a gravidade
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
