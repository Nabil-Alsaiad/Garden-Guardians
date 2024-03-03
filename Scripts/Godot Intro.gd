extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$AnimationPlayer.play("Fade In")
	yield(get_tree().create_timer(0.33), "timeout")
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(1), "timeout")
	$AnimatedSprite.play("default")
	Global.camera.shake(100)
	$CPUParticles2D.emitting = true
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("Fade Out")
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://Intros/Credits Intro.tscn")
	
