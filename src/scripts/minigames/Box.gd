extends KinematicBody2D

export var gravity = 3000
var velocity = Vector2()
var falling = false
var reversedTween = false


func _ready():
	visible = false
	runTween(null, null)
	$Tween.start()
	visible = true


func startTween():
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
		$Tween.stop_all()
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2(0, -1))


func _input(event):
	if event.is_action_pressed('interact'):
		falling = true


func runTween(_object, _key):
	# direita positivo esquerda negativo
	if reversedTween:
		reversedTween = false
		startTween()
	else:
		reverseTween()
		reversedTween = true
