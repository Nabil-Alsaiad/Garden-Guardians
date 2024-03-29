extends Node2D

var vec: Vector2

var _under_mouse: bool = false
var _unit: Node2D = null setget set_unit, get_unit
func get_unit():
	return _unit
func set_unit(value):
	_unit = value
	print('my new _unit: ', value)
	if value != null:
		value.global_position = self.global_position

func set_vec(vec):
	self.vec = vec
	self.name = "land" + str(vec)
	
func can_set_unit() -> bool:
	return self._unit == null
	
func toggle_attacked(value):
	$AttackEffect.visible = value

func _on_Area2D_mouse_entered():
	_under_mouse = true

func _on_Area2D_mouse_exited():
	_under_mouse = false
