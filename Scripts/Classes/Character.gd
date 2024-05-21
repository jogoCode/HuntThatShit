extends CharacterBody2D
class_name Character;

@export var SPEED:float = 300;
@onready var _collisionBox:CollisionShape2D = get_node("CollisionShape2D");

enum LifeState{
	ALIVE,
	DEAD
}

var _actualState:LifeState = LifeState.ALIVE;

var _direction:Vector2; 

func  _ready():
	pass

func _process(delta):
	pass

func GetActualLifeState() -> LifeState:
	return _actualState;

func SetActualLifeState(newLifeState:LifeState) -> void:
	_actualState = newLifeState;
