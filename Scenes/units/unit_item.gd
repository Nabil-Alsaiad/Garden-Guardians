extends Resource

class_name UnitItem

export var name: String = ""
export var texture: Texture

export var max_health: int = 6
export var attack_cooldown: float = 1.0
export var attack_damage: int = 2
export var attack_width: int = 0
export var attack_dis: int = 2
export var attack_dir: String = 'LEFT' setget set_dir, get_dir

func set_dir(value: String) -> void:
	attack_dir = value

func get_dir() -> String:
	return attack_dir
