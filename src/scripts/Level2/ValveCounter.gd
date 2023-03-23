extends Label

var valveCounter = 0


func _ready():
    valveCounter = 0
    text = 'x' + str(valveCounter)


func _on_valveActivated():
    valveCounter += 1
    text = 'x' + str(valveCounter)
    modulate = Color(0.95, 0.98, 0.04, 1)
    yield(get_tree().create_timer(1), 'timeout')
    modulate = Color(1, 1, 1, 1)
