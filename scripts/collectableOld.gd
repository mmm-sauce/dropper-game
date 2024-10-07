extends Area2D

var is_attached = false  # To track whether the briefcase has collided and attached to the player
var top_briefcase # The player node reference

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_attached:
		# Follow the player's X movement, snap to the center
		pass
	else:
		# Continue falling if not attached
		position.y += 5

# When the briefcase collides with the player or top briefcase
func collision(body):
	if body == global.top_briefcase: 

		top_briefcase = body
		is_attached = true
		
		# Check if the current top is the player
		if top_briefcase.name == "player":
			# Parent to the player (first briefcase)
			self.reparent(top_briefcase)
		else:
			# Parent to the player (subsequent briefcases)
			self.reparent(top_briefcase.get_parent())
		
		# Snap the briefcase to the current stack position


		# Increment the stack height
		global.stack_h += 1
		
		# Update the global reference to the new top briefcase
		global.top_briefcase = self
		print(global.top_briefcase)
