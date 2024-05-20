extends Node2D

@onready var _Random = RandomNumberGenerator.new();

@onready var _CharacterScenes = load("res://Scenes/Actor/player_character.tscn");
@onready var _CameraScenes = load("res://Nodes/C_Camera.tscn");
@onready var _ArrowFactoryScenes = load("res://Scenes/Actor/arrow_factory.tscn")
var _Character;
var _Camera;
var _ArrowFactory;
var main;

func _ready():
	y_sort_enabled = true;
	#-------------- Init ArrowFactory---------------------------
	_ArrowFactory = _ArrowFactoryScenes.instantiate();
	add_child(_ArrowFactory);
	#-------------- Init Camera---------------------------------
	_Camera = _CameraScenes.instantiate();
	_Camera._target = _Character;
	add_child(_Camera);
	_Camera.is_current();
	# Set main Scene-----------------------------------------------------------
	main = get_node("/root/Main");


func _process(delta):
	if(_Character == null):
		#----------------- Init Character------------------------------
		_Character = _CharacterScenes.instantiate();
		if(main!= null):
			main.add_child(_Character);
			_Camera._target = _Character;
