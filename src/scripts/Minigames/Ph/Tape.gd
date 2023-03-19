extends Area2D

var selected1 = false
var selected2 = false
var selected3 = false
var selected4 = false
var selected5 = false
var selected6 = false

func _process(delta):
	if selected1==true and selected2 ==true:
		selected2 =false
			
	if selected1==true and selected3==true:
		selected3 =false
		
	if selected1==true and selected4 ==true:
		selected4 =false
			
	if selected1==true and selected5 ==true:
		selected5 =false
	
	if selected1==true and selected6 ==true:
		selected6 =false
	
	if selected2==true and selected3==true:
		selected3 =false
		
	if selected2==true and selected4 ==true:
		selected4 =false
			
	if selected2==true and selected5 ==true:
		selected5 =false
	
	if selected2==true and selected6 ==true:
		selected6 =false

	if selected3==true and selected4 ==true:
		selected4 =false
			
	if selected3==true and selected5 ==true:
		selected5 =false
	
	if selected3==true and selected6 ==true:
		selected6 =false

	if selected4==true and selected5 ==true:
		selected5 =false
	
	if selected4==true and selected6 ==true:
		selected6 =false
	
	if selected5==true and selected6 == true:
		selected6 = false
		
	if selected1 ==true: #deveria manter uma fita selecionada para não selecionar duas
		followMouse()

	if selected2 ==true:
		followMouse()

	if selected3 ==true:
		followMouse()
	if selected4 ==true:
		followMouse()
	if selected5 ==true:
		followMouse()
	if selected6 ==true:
		followMouse()

	if PhGlobal.points == 6:
		print('você ganhou!')



func followMouse():
	position = get_global_mouse_position()


func _on_Tape_1_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected1 = true
		if not event.pressed:
			selected1 = false
	
	if scale.x and scale.y ==2:
		self.set_scale(scale/2)
		

func _on_Tape_1_mouse_entered():
	self.set_scale(scale*2)

func _on_Tape_1_mouse_exited():
	if scale.x and scale.y == 2:
		self.set_scale(scale/2)

func _on_Tape_2_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected2 = true
		if not event.pressed:
			selected2 = false
		get_scale()
		if scale.x and scale.y == 2:
			self.set_scale(scale/2)

func _on_Tape_3_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected3 = true
		if not event.pressed:
			selected3 = false
		get_scale()
		if scale.x and scale.y == 2:
			self.set_scale(scale/2)

func _on_Tape_4_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected4 = true
		if not event.pressed:
			selected4 = false
		get_scale()
		if scale.x and scale.y == 2:
			self.set_scale(scale/2)

func _on_Tape_5_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected5 = true
		if not event.pressed:
			selected5 = false
		get_scale()
		if scale.x and scale.y == 2:
			self.set_scale(scale/2)

func _on_Tape_6_input_event(viewport, event, shape_idx):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			selected6 = true
		if not event.pressed:
			selected6 = false
		get_scale()
		if scale.x and scale.y == 2:
			self.set_scale(scale/2)
		
