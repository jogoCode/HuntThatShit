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
	if(velLength == 0):
		_animatedSprite.play("Idle");
	if(velLength != 0):
		_animatedSprite.play("Walk");
	
	#Gestion de la vitesse d'animation en fonction de la vitesse de déplacement
	_animatedSprite.speed_scale = velLength/2*delta;
	 
	#Gestion de la direction du sprite
	if(_ownerCharacter.velocity.x < 0):
		_animatedSprite.flip_h = true;
	if(_ownerCharacter.velocity.x > 0):
		_animatedSprite.flip_h = false;
