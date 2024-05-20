extends CharacterBody2D
class_name Character;

@export var SPEED:float = 300;
@onready var _collisionBox:CollisionShape2D = get_node("CollisionShape2D");

var _direction:Vector2; 

func  _ready():
	pass

func _process(delta):
	pass
