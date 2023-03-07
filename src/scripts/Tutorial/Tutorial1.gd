extends Node2D


func _ready():
	$Sprite/AnimationPlayer.play("InteractionChemical")
	$Sprite2/AnimationPlayer.play("animation-box")
	
