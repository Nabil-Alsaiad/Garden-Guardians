extends Control

var world_scene = preload("res://Scenes/world.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$AnimationPlayer.play("Fade In")

func _on_Button_pressed():
#	$AnimationPlayer.play("Fade Out")
#	$AudioStreamPlayer.play()
#	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene_to(world_scene)
#	get_tree().change_scene("res://Scenes/world.tscn")

func _on_Button2_pressed():
	$AnimationPlayer.play("Fade Out")
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(1), "timeout")
	pass

func _on_Button3_pressed():
	$AnimationPlayer.play("Fade Out")
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().quit()
