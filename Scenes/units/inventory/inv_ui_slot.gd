extends Panel

export var item: Resource = null

onready var item_ui: Sprite = $CenterContainer/Panel/Item
onready var plant_holder: Node2D = $"../../../../Plants"
onready var world: Node2D = $"../../../.."
var plant_scene = preload("res://Scenes/units/plants/plant.tscn")

var _under_mouse: bool = false
var _my_plant: Node2D = null

func _process(_delta):
	if _my_plant != null or item == null:
		return
	
	if not _under_mouse or not Input.is_action_just_pressed("click"):
		return
		
	if world.started:
		return
	
	_my_plant = plant_scene.instantiate()
	_my_plant.set_item(self.item)
	plant_holder.add_child(_my_plant)
	var mouse_pos = get_global_mouse_position()
	_my_plant.global_position = mouse_pos
	world.select_unit(_my_plant)

func update_item(item: UnitItem):
	if !item:
		item_ui.visible = false
	else:
		self.item = item
		item_ui.visible = true
		item_ui.texture = item.texture

func _on_Panel_mouse_entered():
	_under_mouse = true

func _on_Panel_mouse_exited():
	_under_mouse = false

