extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = position.y+5


func _on_body_entered(body):
	get_parent().get_parent().get_node("scoreboard").score += 1
	queue_free()
