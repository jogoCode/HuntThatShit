extends Node
class_name InputManager

@export var _playerCharacter:PlayerCharacter;
@export var _Weapon:Node2D;

func _ready():
	_playerCharacter = get_parent();
	if(_playerCharacter == null):
		push_error("PlayerCharacter missing please assign a player character node");

func _input(event):
	#------------------ Movement inputs 
	_playerCharacter._direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down");
	
	

func _physics_process(delta):
	#------------------ Weapon inputs
	if(Input.is_action_pressed("Shoot")):
		_Weapon.emit_signal("Shoot");
	if(Input.is_action_just_pressed("Shoot")):
		_Weapon.emit_signal("JustClicked");
	if(Input.is_action_just_released("Shoot")):
		_Weapon.emit_signal("Released");
