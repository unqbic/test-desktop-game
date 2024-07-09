extends Entity
var _speed:float = 250.0
var _direction:Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		randomize()
		_direction = Vector2(sign(int(randf_range(-100, 100))+1), sign(int(randf_range(-100, 10))+1))

func _physics_process(delta: float) -> void:
	
	if is_on_wall():
		_direction.x = _direction.x * -1
		_speed += 2
	
	if is_on_floor() or is_on_ceiling():
		_direction.y = _direction.y * -1
		_speed += 2
	
	velocity = _direction * _speed
	move_and_slide()
