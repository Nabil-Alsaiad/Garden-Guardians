extends Control


func _process(_delta):
	$Sprite.position = get_global_mouse_position()
