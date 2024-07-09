extends Entity
@export_category("Player Settings")
@export var texture:Sprite2D
@export var player_id:int = 0

var _window:Window

var _movement_axis:int:
	get:
		match player_id:
			0:
				return Input.get_axis("p1_up", "p1_down")
			1:
				return Input.get_axis("p2_up", "p2_down")
			_:
				return Input.get_axis("p1_up", "p1_down")


var _acceleration:float = 75.0
var _friction:float = 50.0
var _top_speed:float = 200.0

func _ready():
	texture.flip_h = (player_id > 0)

func _physics_process(delta: float) -> void:
	if _movement_axis != 0:
		velocity.y = lerp(velocity.y, _top_speed * _movement_axis, _acceleration * delta)
	else:
		velocity.y = lerp(velocity.y, 0.0, _friction * delta)
	move_and_slide()
	
