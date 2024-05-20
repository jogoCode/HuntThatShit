extends SpriteAnimator
class_name SplitSpriteAnimator

@export var _staticParts:Array[AnimatedSprite2D];
@export var _turnParts:Array[AnimatedSprite2D];

func _ready():
	pass

func _process(delta):
	super._process(delta);

func ManageSpriteDirection(target)->void:
	_target = get_global_mouse_position();
	 # Retourne la partie amovible
	if(_target.x < global_position.x):
		for turnPart in _turnParts:
			turnPart.flip_h = true;
	if(_target.x > global_position.x):
		for turnPart in _turnParts:
			turnPart.flip_h = false;
