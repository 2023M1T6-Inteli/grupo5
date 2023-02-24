extends Area2D

export (String) var minigameName
export (Texture) var spriteTexture
export (Texture) var strokeTexture

# flag para indicar se o jogador está na área de interação
var canInteract = false


func _on_minigame_body_entered(_body):
	$Stroke.visible = true
	canInteract = true
	$"../HUD/Gamepad/interact".modulate = Color(1, 1, 0.4)


func _on_minigame_body_exited(_body):
	$Stroke.visible = false
	canInteract = false
	$"../HUD/Gamepad/interact".modulate = Color(1, 1, 1)


func _input(event):
	if Global.minigameRunning:
		return

	if event.is_action_released('interact') and canInteract:
		if not $"../Player".canPlayMinigame():
			return

		var minigame = Global.minigames.get(minigameName)
		Global.currentLevel = minigameName
		minigame = minigame.instance()
		$"../HUD".add_child(minigame)
		Global.minigameRunning = true


func _ready():
	$Sprite.texture = spriteTexture
	$Stroke.texture = strokeTexture
