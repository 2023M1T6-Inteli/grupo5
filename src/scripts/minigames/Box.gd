extends KinematicBody2D

export var gravity = 3000
var velocity = Vector2()
# indica se a caixa está caindo
var falling = false
# indica o sentido da animação de slide
var reversedTween = false


func _ready():
	# inicia a animação
	runTween(null, null)
	$Tween.start()


func startTween():
	# calcula tamanho da caixa para compensar a borda
	var boxSize = ($ColorRect.rect_size.x/2)*scale.x
	$Tween.interpolate_property(
		self,
		'global_position',
		Vector2(160+boxSize, 95),
		Vector2(1120-boxSize, 95),
		1,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)


func reverseTween():
	# calcula tamanho da caixa para compensar a borda
	var boxSize = ($ColorRect.rect_size.x/2)*scale.x
	$Tween.interpolate_property(
		self,
		'global_position',
		Vector2(1120-boxSize, 95),
		Vector2(160+boxSize, 95),
		1,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	
	
func _physics_process(delta):
	if falling:
		# desativa a animação e aplica gravidade
		$Tween.stop_all()
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2(0, -1))


func _input(event):
	if event.is_action_pressed('interact'):
		# ao apertar uma tecla de interação, a box começa a cair
		falling = true


func runTween(_object, _key):
	# controla a animação, escolhendo o lado
	if reversedTween:
		startTween()
		reversedTween = false
	else:
		reverseTween()
		reversedTween = true
