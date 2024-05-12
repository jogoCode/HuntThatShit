extends Node2D

signal Shoot(); 
signal Released();
signal JustClicked();
signal ChangedState();


@export var _arrowScene:PackedScene;
var _direction:Vector2

var _canCreateArrow:bool;

signal createArrow(arrow);

enum weaponState{
	DISABLE,
	ACTIVE
}

var _currentState:weaponState = weaponState.DISABLE;

func _ready():
	_currentState = weaponState.ACTIVE;
	$AnimatedSprite2D.frame = 1;
	$AnimatedSprite2D.speed_scale = 0;
	


func _process(delta):
	_direction = get_global_mouse_position();
	look_at(_direction);
	WeaponStateManager()
	#--------Temporaire
	if($AnimatedSprite2D.frame == 4):
		$AnimatedSprite2D.frame = 4;

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


func CreateArrow():
	if(_canCreateArrow):
		#----------------Creation arrow -------------->
		var arrow = _arrowScene.instantiate();
		arrow._speed = arrow._speed*$AnimatedSprite2D.frame/4;
		if($AnimatedSprite2D.frame == 4):
			arrow._speed = arrow._speed*2;
		arrow.transform = global_transform;
		arrow._owner = get_parent();
		Level._ArrowFactory.createArrow.emit(arrow);
		_canCreateArrow =false;
		#-------------------- End -------------------

func _on_changed_state():
	EchangeState();

func _on_shoot():
	$AnimatedSprite2D.speed_scale = 1;
	for nodes in get_children():
		nodes.emit_signal("SetVelocity",randf_range(17,20));
	$AnimatedSprite2D.play("Shoot");

func _on_released():
	CreateArrow();
	for nodes in get_children():
		nodes.emit_signal("SetVelocity",20);
	$AnimatedSprite2D.frame = 1;
	$AnimatedSprite2D.speed_scale = 0;


func _on_inventory_system_lose_arrow_signal():
	_canCreateArrow = true;
