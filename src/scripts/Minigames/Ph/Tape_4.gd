extends Area2D


func _process(delta):

	if  PhGlobal.selected4 ==true and PhGlobal.selected1==false and PhGlobal.selected2==false and PhGlobal.selected3==false: 
		followMouse()

	if PhGlobal.points == 6:
		print('você ganhou!')

func followMouse():
	position = get_global_mouse_position()

func _on_Tape_4_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			PhGlobal.selected4 = true
		if not event.pressed:
			PhGlobal.selected4 = false
		get_scale()
		if scale.x and scale.y == 2:
			self.set_scale(scale/2)

func _on_Tape_4_mouse_entered():
	if PhGlobal.zoom1 ==false and PhGlobal.zoom2==false and PhGlobal.zoom3==false and PhGlobal.zoom6==false and PhGlobal.zoom5==false:
		PhGlobal.zoom4 = true
		if PhGlobal.zoom4 == true:
			self.set_scale(scale*2)
		
func _on_Tape_4_mouse_exited():
	PhGlobal.zoom4 = false
	if scale.x and scale.y == 2:
		self.set_scale(scale/2)



func _on_Tape_4_area_entered(area):
	PhGlobal.points +=1 
