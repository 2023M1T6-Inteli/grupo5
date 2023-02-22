extends Node2D

# indica se tem algum pallet selecionado na cena
var palletSelected


func _on_ContinueButton_pressed():
	Global.minigameRunning = false
	queue_free()


func _ready():
	$WinScreen.visible = false


func _process(_delta):
	if ($FixedWood2/TopPosition.ocuppied and 
		$FixedWood2/MiddlePosition.ocuppied and
		$FixedWood2/BottomPosition.ocuppied
	):
		$WinScreen.visible = true
