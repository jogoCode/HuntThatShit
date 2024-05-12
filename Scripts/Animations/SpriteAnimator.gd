extends Node2D
class_name SpriteAnimator

@export var _ownerCharacter:CharacterBody2D; 
@export var _animatedSprite: Array[AnimatedSprite2D] = [null,null];

@export var _target:Vector2;

@export var _canFlip:bool;
#Character values
var velLength:float;

func _ready():
	if _ownerCharacter == null:
		print_debug("ownerCharacter is missing !");
	for aSprites in _animatedSprite:
		if aSprites == null:
			print_debug("animatedSprite missing !")

func _process(delta):
	velLength = _ownerCharacter.velocity.length();
	if(velLength == 0):
		for aSprites in _animatedSprite:
			aSprites.play("Idle");
	if(velLength != 0):
		for aSprites in _animatedSprite:
			aSprites.play("Walk");
	ManageSpriteSpeed(delta);
	if(_canFlip):
		pass
	ManageSpriteDirection(_target);
 
func ManageSpriteSpeed(delta)->void:
	#Gestion de la vitesse d'animation en fonction de la vitesse de déplacement
	for aSprites in _animatedSprite:
		aSprites.speed_scale = velLength*delta;

func ManageSpriteDirection(target)->void: 
	#Gestion de la direction du sprite
	if(_ownerCharacter.velocity.x < 0):
		for aSprites in _animatedSprite:
			aSprites.flip_h = true;
	if(_ownerCharacter.velocity.x > 0):
		for aSprites in _animatedSprite:
			aSprites.flip_h = false;
