extends CanvasLayer

func _ready():
	set_visible(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused


func set_visible(is_visible):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	for node in get_children():
		node.visible = is_visible

func _on_Resume_pressed():
	get_tree().paused = false
	set_visible(false)
