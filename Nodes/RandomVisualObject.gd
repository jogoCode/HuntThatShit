extends Node2D

@export var _animatedSprite:Array[AnimatedSprite2D];
@onready var _rng = Level._Random
func _ready():
	if(_animatedSprite == null):
		push_error("_animatedSprie is null plz add a ref");
	var random = _rng.randf_range(0,_animatedSprite[0].sprite_frames.get_frame_count("versions"));
	for visual in _animatedSprite:
		visual.frame = random;

