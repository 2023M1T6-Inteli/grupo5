extends KinematicBody2D

export (int) var run_speed = 300 #velocidade da corrida
export (int) var jump_speed = -400 #velocidade do pulo
export (int) var gravity = 1200 #velocidade da gravidade

onready var sprite = get_node("Sprite")
onready var animation = get_node("Animation")

# var epi recebe um valor bool false para que a função referenciada no script de epi mude tal valor e o personagem
# pegue a bota. # Gabriel de Macedo
var epi:bool = false
# var cap_epi recebe um valor bool false para que a função no script em cap_epi mude tal valor para true e o objeto suma
# Gabriel de Macedo
var cap_epi:bool = false

var velocity = Vector2()
var jumping = false


func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("move_right")
	var left = Input.is_action_pressed("move_left")
	var jump = Input.is_action_just_pressed("jump")

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
		animation.play("run")
		sprite.flip_h = false
	if left:
		velocity.x -= run_speed
		animation.play("run")
		sprite.flip_h = true

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
