extends Node2D

signal createArrow(arrow);

func spawnArrow(arrow):
	add_child(arrow);



func _on_create_arrow(arrow):
	spawnArrow(arrow)
