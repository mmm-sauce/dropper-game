extends CharacterBody2D

var movespeed = 350
var current_speed = 0
const accel = 3  # acceleration rate
const decel = 0.1  # deceleration rate when no input
var input_direction = Vector2.ZERO  # Joystick input direction
@export var joystick: Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	joystick.input_direction
	if input_direction != Vector2.ZERO:
		# Move based on the joystick input
		current_speed = lerp(float(current_speed), movespeed * input_direction.x, accel * delta)
		$Sprite2D.flip_h = input_direction.x < 0
	else:
		# Decelerate when no input
		current_speed = lerp(float(current_speed), 0.0, decel)
		
	velocity.x = current_speed
	$RigidBody2D.linear_velocity.x = current_speed
	move_and_slide()

# Function to receive joystick input
func set_joystick_direction(direction: Vector2):
	input_direction = direction
