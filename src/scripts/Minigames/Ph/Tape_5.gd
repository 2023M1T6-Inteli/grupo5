extends Area2D


func _process(delta):

	if PhGlobal.selected5 ==true and PhGlobal.selected1==false and PhGlobal.selected2==false and PhGlobal.selected3==false and PhGlobal.selected4==false:  
		followMouse()

	if PhGlobal.points == 6:
		print('você ganhou!')

func followMouse():
	position = get_global_mouse_position()

func _on_Tape_5_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			PhGlobal.selected5 = true
		if not event.pressed:
			PhGlobal.selected5 = false
		get_scale()
		if scale.x and scale.y == 1.5:
			self.set_scale(scale/1.5)

func _on_Tape_5_mouse_entered():
	if PhGlobal.zoom1 ==false and PhGlobal.zoom2==false and PhGlobal.zoom3==false and PhGlobal.zoom4==false and PhGlobal.zoom6==false:
		PhGlobal.zoom5 = true
		if PhGlobal.zoom5 == true:
			self.set_scale(scale*1.5)
		
func _on_Tape_5_mouse_exited():
	PhGlobal.zoom5 = false
	if scale.x and scale.y == 1.5:
		self.set_scale(scale/1.5)


