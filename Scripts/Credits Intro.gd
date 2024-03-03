extends Control


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$AnimationPlayer.play("Fade In")
	yield(get_tree().create_timer(2.2), "timeout")
	$AnimationPlayer.play("Fade Out")
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://Scenes/Menu.tscn")
