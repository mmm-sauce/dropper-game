extends Control

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$scoretext.text = str(global.stack_h)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$scoretext.text = str(global.stack_h)
