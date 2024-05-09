extends Node2D

signal Shoot(); 
signal Released();
signal ChangedState();

@export var _arrowScene:PackedScene;

var _direction:Vector2

signal createArrow(arrow);

enum weaponState{
	DISABLE,
	ACTIVE
}

var _currentState:weaponState = weaponState.DISABLE;

func _ready():
	_currentState = weaponState.ACTIVE;
	$AnimatedSprite2D.speed_scale = 0;


func _process(delta):
	_direction = get_global_mouse_position();
	look_at(_direction);
	WeaponStateManager()
	#--------Temporaire
	print($AnimatedSprite2D.frame)
	if($AnimatedSprite2D.frame == 3):
		$AnimatedSprite2D.frame = 3;

func WeaponStateManager():
	match(_currentState):
		weaponState.DISABLE:
			hide();
		weaponState.ACTIVE:
			show();

func EchangeState():
	match(_currentState):
		weaponState.DISABLE:
			weaponState.ACTIVE;
		weaponState.ACTIVE:
			weaponState.DISABLE;

func _on_changed_state():
	EchangeState();

func _on_shoot():
	$AnimatedSprite2D.speed_scale = 1;
	$AnimatedSprite2D.play("Shoot");

func _on_released():
	var arrow = _arrowScene.instantiate();
	arrow.transform = global_transform;
	createArrow.emit(arrow);
	$AnimatedSprite2D.frame = 0;
	$AnimatedSprite2D.speed_scale = 0;
