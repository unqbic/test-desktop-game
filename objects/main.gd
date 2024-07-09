extends Node

@onready var main_window:Window = get_window()

@onready var p1_window:Window  = get_node("P1")
@onready var p2_window:Window = get_node("P2")

@onready var camera:Camera2D = get_node("BallEntity/Camera")

#region Objects sizes
var _ball_size:Vector2i = Vector2i(8 * 3, 8 * 3)
var _player_size:Vector2i = Vector2(8, 31)
#endregion

func _ready() -> void:
	ProjectSettings.set_setting("display/window/per_pixel_transparency/allowed", true)
	main_window.borderless = true
	main_window.unresizable = true
	main_window.gui_embed_subwindows = false
	main_window.always_on_top = true
	main_window.transparent = true
	main_window.transparent_bg = true
	
	main_window.min_size = _ball_size * Vector2i(camera.zoom)
	main_window.size = main_window.min_size
	
	for i in get_children():
		if i is Window:
			i.world_2d = main_window.world_2d

func _process(delta: float) -> void:
	main_window.position = get_window_pos_from_camera()

func get_window_pos_from_camera()->Vector2i:
	return (Vector2i(camera.global_position + camera.offset) - _ball_size / 2) * Vector2i(camera.zoom)
