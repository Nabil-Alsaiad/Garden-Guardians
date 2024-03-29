extends Node2D

onready var world: Node2D = $"../.."
var _current_health: int = 0
var _last_attack_time: float = 0.0

export(Resource) var data_resource: Resource = null setget set_item, get_item
var data: UnitItem
func get_item():
	return data_resource
func set_item(value: Resource):
	data_resource = value
	data = data_resource as UnitItem

var land: StaticBody2D = null setget _set_land, _get_land
func _get_land():
	return land
func _set_land(value: StaticBody2D):
	land = value
	print('my new land: ', land)
	if land != null:
		land.set_unit(self)

func _ready():
	_current_health = data.max_health
	print('unit-ready')
	
func _process(delta):
	if world.timer - _last_attack_time >= data.attack_cooldown:
		_last_attack_time = world.timer
		_attack()

func _attack() -> void:
	var lands = get_attackable_lands()
	for land in lands:
		var attacked_unit = land.get_unit()
		if is_instance_valid(attacked_unit):
			attacked_unit.take_damage(data.attack_damage)
			print('unit ', self.name, ' attacking ', land.get_unit())

func take_damage(damage: int) -> void:
	_current_health -= damage
	if _current_health <= 0:
		print("unit ", data.name, ' has died')
		self.queue_free()

func get_attackable_lands():
	if land == null:
		return
	
	var lands = $"../..".lands
	var attackable_lands = []
	var current_vec = land.vec
	
	var dirs = {
		'LEFT': Vector2(-1, 0),
		'RIGHT': Vector2(1, 0),
		'UP': Vector2(0, -1),
		'DOWN': Vector2(0, 1)
	}
	
	var dist = data.attack_dis
	
	for i in range(1, dist + 1):
		if data.attack_dir == 'ROUND':
			for x in range(-dist, dist + 1):
				for y in range(-dist, dist + 1):
					var new_vec1 = current_vec + Vector2(x, y)
					if valid_vec(new_vec1):
						attackable_lands.append(lands[new_vec1])
		else:
			var dir = dirs[data.attack_dir]
			var new_vec = current_vec + dir * i
			if valid_vec(new_vec):
				attackable_lands.append(lands[new_vec])
				for j in range(1, data.attack_width + 1):
					var new_vec1: Vector2
					var new_vec2: Vector2
					
					if data.attack_dir == 'LEFT' or data.attack_dir == 'RIGHT':
						new_vec1 = Vector2(new_vec.x, new_vec.y - j)
						new_vec2 = Vector2(new_vec.x, new_vec.y + j)
					elif data.attack_dir == 'UP' or data.attack_dir == 'DOWN':
						new_vec1 = Vector2(new_vec.x - j, new_vec.y)
						new_vec2 = Vector2(new_vec.x + j, new_vec.y)

					if valid_vec(new_vec1):
						attackable_lands.append(lands[new_vec1])
					if valid_vec(new_vec2):
						attackable_lands.append(lands[new_vec2])
	
	if attackable_lands.has(self.land):
		attackable_lands.erase(self.land)
		
	return attackable_lands

func valid_vec(vec):
	var size = $"../..".grid_size
	return vec.x >= 0 and vec.x < size.x and vec.y >= 0 and vec.y < size.y
