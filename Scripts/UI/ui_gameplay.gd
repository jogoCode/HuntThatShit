extends Control


@onready var _ArrowText:Label = get_node("ArrowControl/AspectRatioContainer/ArrowText");

func _ready():
	pass
	to_string()


func _physics_process(delta):
	_ArrowText.text = str(Level._Character.get_node("InventorySystem")._ArrowNum);
