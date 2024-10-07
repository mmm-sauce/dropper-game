extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Handles the counting logic
	add_to_group("collectables")
	
	
	
	# Create a physics material to control friction and bounce
	var physics_material = PhysicsMaterial.new()
	physics_material.friction = 4  # Higher friction so briefcases don't slide off easily
	physics_material.bounce = 0.05  # Low bounciness to ensure briefcases settle

	# Apply the material to the briefcase
	self.physics_material_override = physics_material

	# Constrain rotation to prevent briefcases from flipping too much
	set_angular_velocity(0)  # Stop rotation initially
	angular_damp = 4.0  # Control how fast it slows down rotation when hit
