extends Control

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	$scoretext.text = str(global.stack_h)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collectables = get_tree().get_nodes_in_group("collectables")
	var global.stack_h = 0
	for i in collectables:
		if i.velocity.y > 10:
			count 
	$scoretext.text = str(global.stack_h)
