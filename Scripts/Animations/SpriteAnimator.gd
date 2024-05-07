extends Node
class_name SpriteAnimator

@export var _ownerCharacter:CharacterBody2D; 
@export var _animatedSprite:AnimatedSprite2D;

func _ready():
	if _ownerCharacter == null:
		print_debug("ownerCharacter is missing !");
	if _animatedSprite == null:
		print_debug("animatedSprite missing !")

func _process(delta):
	var velLength = _ownerCharacter.velocity.length();
	if(_ownerCharacter.velocity.length() == 0):
		_animatedSprite.play("Idle");
	if(_ownerCharacter.velocity.length() != 0):
		_animatedSprite.play("Walk");
	_animatedSprite.speed_scale = velLength/2*delta;
	
	if(_ownerCharacter.velocity.x < 0):
		_animatedSprite.flip_h = true;
	if(_ownerCharacter.velocity.x > 0):
		_animatedSprite.flip_h = false;
