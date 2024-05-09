extends Node2D

var _direction:Vector2;
var _speed = 1000;

func _ready():
	_direction = Vector2.RIGHT.rotated(rotation);

func _process(delta):
	var velocity = _direction*_speed*delta;;
	global_position += velocity;
