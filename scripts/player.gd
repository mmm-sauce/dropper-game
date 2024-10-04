extends CharacterBody2D

var stack_h = 0
var movespeed = 500
var current_speed = 0
const accel = 30  # acceleration rate
const decel = 0.1  # deceleration rate when no input

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		current_speed = max((current_speed - 50) - 40*accel * delta, -movespeed)
	elif Input.is_action_pressed("right"):
		current_speed = min((current_speed + 50) + 40*accel * delta, movespeed)
	else:
		current_speed = lerp(float(current_speed), 0.0, float(decel))

	velocity.x = current_speed
	move_and_slide()
