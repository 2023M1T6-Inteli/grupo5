extends Sprite

# carrega os slots disponíveis
onready var dropNodes = get_tree().get_nodes_in_group('dropNodes')
# indica se o pallet está selecionado
var selected = false
# indica se o mouse está em cima do pallet
var hovering = false
# indica o slot que o pallet
export var dropPoint = 0


# controle da propriedade que indica se o mouse está no pallet
func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false


func _input(event):
	if $'..'.palletSelected != null and $'..'.palletSelected != $'.':
		# se algum outro pallet já está selecionado, retorna
		return

	if hovering and event is InputEventMouseButton:
		if event.pressed:
			# se o pallet for selecionado
			# desocupa o slot atual
			dropPoint.ocuppied = false
			# atualiza as variáveis que informam a seleção atual
			selected = true
			$'..'.palletSelected = $'.'
		else:
			# se ele for solto
			# atualiza as variáveis que informam a seleção atual
			selected = false
			$'..'.palletSelected = null

			# procura o slot mais próximo
			var shortDistance = 100
			for node in dropNodes:
				# passa por todos os slots
				if node.ocuppied:
					# se o slot estiver ocupado, pula
					continue
				var distance = global_position.distance_to(node.global_position)
				if distance < shortDistance:
					# se a distância atual for menor do que a menor distância
					# atualiza o node e a distância selecionado
					dropPoint = node
					shortDistance = distance

			dropPoint.ocuppied = true


func _ready():
	# carrega o pallet em um dos slots iniciais do store
	dropPoint = dropNodes[dropPoint]
	dropPoint.ocuppied = true


func _physics_process(delta):
	if selected:
		# se estiver selecionado, o pallet segue o mouse
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		# senão, vai para o slot selecionado
		global_position = lerp(global_position, dropPoint.global_position, 25*delta)
