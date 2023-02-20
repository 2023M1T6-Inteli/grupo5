extends Node

func _ready():
	for PPE in get_children():
		# desliga a animação de todos os EPIs na prancheta
		PPE.get_node('Animation').seek(0.5, true)
		PPE.get_node('Animation').stop()

func _process(_delta):
	for PPE in get_children():
		if PPE.PPEName in $"../../../Player".PPEs:
			# Se o epi estiver com o player, deixa visível
			PPE.modulate = Color(1, 1, 1, 1)
