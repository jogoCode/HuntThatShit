extends Node



@onready var _CharacterScenes = load("res://Scenes/Actor/player_character.tscn");
@onready var _CameraScenes = load("res://Nodes/C_Camera.tscn");
@onready var _ArrowFactoryScenes = load("res://Scenes/Actor/arrow_factory.tscn")
var _Character;
var _Camera;
var _ArrowFactory;

func _ready():
	#--- Init ArrowFactory---------------------------
	_ArrowFactory = _ArrowFactoryScenes.instantiate();
	add_child(_ArrowFactory);
	#--- Init Character------------------------------
	_Character = _CharacterScenes.instantiate();
	add_child(_Character);
	#--- Init Camera---------------------------------
	_Camera = _CameraScenes.instantiate();
	_Camera._target = _Character;
	add_child(_Camera);
	_Camera.is_current();


func _process(delta):
	pass
