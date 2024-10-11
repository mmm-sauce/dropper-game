extends Control

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$scoretext.text = str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collectables = get_tree().get_nodes_in_group("collectables")
	score = 0
	for i in collectables:
		if i.linear_velocity.y  < 120 && i.position.y > 100:
			score += 1
	$scoretext.text = str(score)
