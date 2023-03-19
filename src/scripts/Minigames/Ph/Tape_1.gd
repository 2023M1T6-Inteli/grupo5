extends Area2D


func _process(delta):

	if PhGlobal.selected1 ==true: 
		followMouse()

	if PhGlobal.points == 6:
		print('você ganhou!')
		$WinScreen.visible(true)

func followMouse():
	position = get_global_mouse_position()

func _on_Tape_1_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			PhGlobal.selected1 = true
		if not event.pressed:
			PhGlobal.selected1 = false
		get_scale()
		if scale.x and scale.y == 2:
			self.set_scale(scale/2)

func _on_Tape_1_mouse_entered():
	if PhGlobal.zoom6 ==false and PhGlobal.zoom2==false and PhGlobal.zoom3==false and PhGlobal.zoom4==false and PhGlobal.zoom5==false:
		PhGlobal.zoom1 = true
		if PhGlobal.zoom1 == true:
			self.set_scale(scale*2)

func _on_Tape_1_mouse_exited():
	PhGlobal.zoom1 = false
	if scale.x and scale.y == 2:
		self.set_scale(scale/2)
		
func _on_Tape_1_area_entered(area):
	PhGlobal.points +=1
