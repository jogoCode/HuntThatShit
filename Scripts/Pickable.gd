extends Node2D
class_name Pickable

@export var _type:String;

func _ready():
	pass


func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print(body);
