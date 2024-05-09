extends Node2D

func spawnArrow(arrow):
	add_child(arrow);


func _on_weapon_create_arrow(arrow):
	spawnArrow(arrow);
