extends CharacterBody2D


var movespeed = 350
var current_speed = 0
const accel = 15  # acceleration rate
const decel = 0.03  # deceleration rate when no input

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.top_briefcase == null:
		global.top_briefcase = self
	
	if Input.is_action_pressed("left"):
		current_speed = max((current_speed) - 40*accel * delta, -movespeed)
		$Sprite2D.flip_h = true
	elif Input.is_action_pressed("right"):
		current_speed = min((current_speed) + 40*accel * delta, movespeed)
		$Sprite2D.flip_h = false
	else:
		current_speed = lerp(float(current_speed), 0.0, float(decel))

	velocity.x = current_speed
	move_and_slide()
