@tool
extends Character
class_name IA


@export var _Stats:AnimalsCharac;
@export var _hungerSystem:HungerSystem;
@export var _healthSystem:HealthSystem;
@export var _nav:NavigationAgent2D;

var _target:Node2D;

func _ready():
	#-------------------- HealthSystem------------
	_healthSystem._hp = _Stats._hp;
	_healthSystem._maxHp = _Stats._hp;
	#-------------------- HungerSystem------------
	_hungerSystem._hunger = _Stats._hunger;
	_hungerSystem._foodType = _Stats._food;

func _physics_process(delta):
	move_and_slide();

func _on_healh_system_death():
	_collisionBox.queue_free();
	hide();

func _get_configuration_warnings():
	if( !_hungerSystem ):
		return "hungerSystem missing !";
	else:
		return ""
	if( !_healthSystem ):
		return "healthSystem missing !";
	else:
		return ""
