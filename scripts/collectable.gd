extends Area2D

var is_attached = false  # To track whether the briefcase has collided and attached to the player
var player  # The player node reference


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_attached and player:
		# Follow the player's X movement, snap to the center
		position.x = 0
	else:
		# Continue falling if not attached
		position.y += 5


# When the briefcase collides with the player
func _on_body_entered(body):
	if body.name == "player":  # Assuming the player node is named "Player"
		# Attach the briefcase to the player
		player = body
		is_attached = true
		
				# Parent the briefcase to the player
		self.reparent(player)
		# Snap the briefcase to the player's X position (center it on the player)

		position.x = 0
		position.y = - player.get_node("CollisionShape2D").shape.size.y/2 - $CollisionShape2D.shape.size.y/2 - (player.stack_h * $CollisionShape2D.shape.size.y) # ???  
		player.stack_h += 1
