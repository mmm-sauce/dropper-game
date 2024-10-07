extends Control

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	$scoretext.text = str(global.stack_h)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collectables = get_tree().get_nodes_in_group("collectables")
	global.stack_h = 0
	for i in collectables:
		if i.linear_velocity.y  < 90 && i.position.y > 100:
			global.stack_h += 1
	$scoretext.text = str(global.stack_h)
