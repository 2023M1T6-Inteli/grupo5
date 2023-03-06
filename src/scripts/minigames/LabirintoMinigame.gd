extends KinematicBody2D

var movespeed = 200
onready var animationEmpilhadeira = $AnimatedSprite

func _physics_process(_delta):
	var velocity = Vector2()
	
	# interpreta os inputs de movimentação, aplica as velocidades e seleciona a animação certa para cada direção
	if Input.is_action_pressed("ui_left"):
		velocity.x= -1
		animationEmpilhadeira.play("left")
	if Input.is_action_pressed("ui_right"):
		velocity.x= 1
		animationEmpilhadeira.play("right")
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
		animationEmpilhadeira.play("down")
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
		animationEmpilhadeira.play("up")
	velocity = move_and_slide(velocity*movespeed)
	
	
