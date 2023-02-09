extends KinematicBody2D

export (int) var run_speed = 300 
export (int) var jump_speed = -400 
export (int) var gravity = 1200 
onready var sprite = get_node("Sprite")
onready var animation = get_node("Animation")

# var epi recebe um valor bool false para que a função referenciada no script de epi mude tal valor e o personagem
# pegue a bota. 
var epi:bool = false
# var cap_epi recebe um valor bool false para que a função no script em cap_epi mude tal valor para true e o objeto suma
var cap_epi:bool = false

var velocity = Vector2()
var jumping = false


func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("move_right") # Recebe o input do teclado, mover para direita
	var left = Input.is_action_pressed("move_left") # Recebe o input do teclado, mover para esquerda
	var jump = Input.is_action_just_pressed("jump") # Recebe o input do teclado, pular

	if jump and is_on_floor(): # Verifica se está em contato com o chão, para poder pular
		jumping = true 
		velocity.y = jump_speed # Altera a velocidade no eixo y
	if right: 
		velocity.x += run_speed # altera a velocidade no eixo x
		animation.play("run") # da play na animação de correr
		sprite.flip_h = false 
	if left:
		velocity.x -= run_speed
		animation.play("run")
		sprite.flip_h = true # inverte o sentido da sprite ao mudar de lado



func _physics_process(delta): 
	get_input() # chama a função do get input (movimentação)
	velocity.y += gravity * delta # atualiza a velocidade no eixo y com o valor da gravidade
	if jumping and is_on_floor():
		jumping = false # deixa o modo jumping falso, para poder 'recarregar' o pulo ao tocar no chão
	velocity = move_and_slide(velocity, Vector2(0, -1))
