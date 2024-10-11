extends Control

var joystick_active = false
var joystick_center = Vector2()
var joystick_radius = 50  # Adjust as necessary
var input_direction = Vector2.ZERO

signal joystick_moved(direction: Vector2)  # Signal to send joystick input

func _ready():
	joystick_center = position + size / 2

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				joystick_active = true
				input_direction = Vector2.ZERO
				emit_signal("joystick_moved", input_direction)
			else:
				joystick_active = false
				input_direction = Vector2.ZERO
				emit_signal("joystick_moved", input_direction)
	elif event is InputEventMouseMotion and joystick_active:
		var mouse_position = event.position
		var direction = (mouse_position - joystick_center).clamped(joystick_radius)
		input_direction = direction / joystick_radius  # Normalize to [-1, 1]
		emit_signal("joystick_moved", input_direction)

func _process(delta):
	if joystick_active:
		handle_position()

func handle_position():
	$Handle.rect_position = joystick_center + input_direction * joystick_radius
