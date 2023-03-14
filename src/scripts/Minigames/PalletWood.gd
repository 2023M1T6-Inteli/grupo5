extends Sprite

# carrega os slots disponíveis
onready var dropNodes = get_tree().get_nodes_in_group('dropNodes')
# indica se a madeira está selecionado
var selected = false
# indica se o mouse está em cima da madeira
var hovering = false
# indica o slot que a madeira
export var dropPoint = 0


# controle da propriedade que indica se o mouse está na madeira
func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false


func _input(event):
	if $'..'.woodSelected != null and $'..'.woodSelected != $'.':
		# se alguma outra madeira já está selecionado, retorna
		return

	if hovering and event is InputEventMouseButton:
		if event.pressed:
			# desocupa o slot atual
			dropPoint.ocuppied = false
			# atualiza as variáveis que informam a seleção atual
			selected = true
			$'..'.woodSelected = $'.'
		else:
			# se a madeira for solto, atualiza as variáveis que informam a seleção atual
			selected = false
			$'..'.woodSelected = null

			# procura o slot mais próximo passando por todos eles
			var shortDistance = 100
			for node in dropNodes:
				if node.ocuppied:
					# se o slot estiver ocupado, pula
					continue

				# calcula a distância
				var distance = global_position.distance_to(node.global_position)
				if distance < shortDistance:
					# se a distância atual for menor do que a menor distância
					# atualiza o node e a distância selecionado
					dropPoint = node
					shortDistance = distance

			# indica que o slot selecionado está ocupado
			dropPoint.ocuppied = true


func _ready():
	# carrega a madeira em um dos slots iniciais do store
	dropPoint = dropNodes[dropPoint]
	dropPoint.ocuppied = true


func _physics_process(delta):
	if selected:
		# se estiver selecionado, a madeira segue o mouse
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		# senão, vai para o slot selecionado
		global_position = lerp(global_position, dropPoint.global_position, 25*delta)
