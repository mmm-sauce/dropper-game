extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Handles the counting logic
	add_to_group("collectables")
	
	# Constrain rotation to prevent briefcases from flipping too much
	set_angular_velocity(0)  # Stop rotation initially
	
	
func _process(delta: float) -> void:
	# Removes collectable once below the screen
	if position.y > get_viewport_rect().size.y + 200:
		queue_free()
		print("free")
