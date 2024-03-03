extends "res://scenes/units/unit.gd"

export var land_pos: Vector2 = Vector2.ZERO

func managed_ready():
	var lands = $"../..".lands
	self.land = lands[Vector2(land_pos.x, land_pos.y)]
	self.land.set_unit(self)

func _on_area_2d_mouse_entered():
	world.select_unit(self)

func _on_area_2d_mouse_exited():
	world.deselect_unit(self)
