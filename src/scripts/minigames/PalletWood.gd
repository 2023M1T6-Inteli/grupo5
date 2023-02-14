extends Sprite

onready var dropNodes = get_tree().get_nodes_in_group('dropNodes')
var selected = false
var hovering = false
export var dropPoint = 0

func _ready():
	dropPoint = dropNodes[dropPoint]
	dropPoint.ocuppied = true

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, dropPoint.global_position, 25*delta)

func _input(event):
	if $"..".palletSelected != null and $"..".palletSelected != $".":
		return
	if hovering and event is InputEventMouseButton:
		if not event.pressed:
			selected = false
			$"..".palletSelected = null
			var shortDistance = 100
			for node in dropNodes:
				var distance = global_position.distance_to(node.global_position)
				if distance < shortDistance:
					if node.ocuppied:
						print('ocu')
						continue
					dropPoint = node
			dropPoint.ocuppied = true

		else:
			dropPoint.ocuppied = false
			selected = true
			$"..".palletSelected = $"."

func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false
