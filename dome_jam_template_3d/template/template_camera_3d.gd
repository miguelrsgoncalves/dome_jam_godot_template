extends Camera3D

@export var move_speed: float = 10.0
@export var mouse_sensitivity: float = 0.003

var rotation_x: float = 0.0
var rotation_y: float = 0.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_x -= event.relative.y * mouse_sensitivity
		rotation_y -= event.relative.x * mouse_sensitivity
		
		rotation_x = clamp(rotation_x, deg_to_rad(-89), deg_to_rad(89))
		
		transform.basis = Basis()
		rotate_object_local(Vector3.UP, rotation_y)
		rotate_object_local(Vector3.RIGHT, rotation_x)
	
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		return
	
	var input_dir = Vector3.ZERO
	
	if Input.is_key_pressed(KEY_W):
		input_dir.z -= 1
	if Input.is_key_pressed(KEY_S):
		input_dir.z += 1
	if Input.is_key_pressed(KEY_A):
		input_dir.x -= 1
	if Input.is_key_pressed(KEY_D):
		input_dir.x += 1
	if Input.is_key_pressed(KEY_E):
		input_dir.y += 1
	if Input.is_key_pressed(KEY_Q):
		input_dir.y -= 1
	
	input_dir = input_dir.normalized()
	translate(input_dir * move_speed * delta)
