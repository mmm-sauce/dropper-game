extends Node2D

var collectable = preload("res://scenes/collectable.tscn")
# Called when the node enters the scene tree for the first time.

func _on_timer_timeout():
	var newcollectable = collectable.instantiate()
	add_child(newcollectable)
	var spawnpos = randi_range(0,get_window().content_scale_size.x)
	newcollectable.position.x = spawnpos
