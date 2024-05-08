extends Node2D

signal Shoot(); 

enum weaponState{
	DISABLE,
	ACTIVE
}

var _currentState:weaponState;

func _ready():
	_currentState = weaponState.DISABLE;


func _process(delta):
	look_at(get_global_mouse_position());
	WeaponStateManager()


func WeaponStateManager():
	match(_currentState):
		weaponState.DISABLE:
			hide();
		weaponState.ACTIVE:
			show();


func _on_shoot():
	match(_currentState):
		weaponState.DISABLE:
			_currentState = weaponState.ACTIVE;
