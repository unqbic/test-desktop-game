extends Window
@export var is_ball:bool = false
@export var camera:Camera2D

var _velocity:Vector2i
var _last_pos:Vector2i

var _player_size:Vector2i = Vector2(8 * 3, 31 * 3)
var _ball_size:Vector2i = Vector2i(8 * 3, 8 * 3)

func _ready():
	transient = true
	borderless = true
	#unresizable = true
	transparent = true
	#transparent_bg = true
	
	min_size = _player_size if !is_ball else _ball_size
	size = min_size
	close_requested.connect(queue_free)

func _process(delta: float) -> void:
	position = get_camera_pos_from_window()

func get_camera_pos_from_window()->Vector2i:
	return (Vector2i(camera.global_position + camera.offset) - _player_size / 2) * Vector2i(camera.zoom)
