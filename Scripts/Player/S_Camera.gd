extends Camera2D

@export var _target:CharacterBody2D;
@export var _moveSpeed:float; 
@export var _zoomRatio:float;

func _ready():
	if(_target == null):
		print_debug("La camera n'as pas de cible");
	
func _process(delta):
	position = lerp(position,_target.position,_moveSpeed*delta);
	offset = lerp(offset,_target.velocity,_moveSpeed*0.5*delta);
