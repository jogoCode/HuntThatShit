extends Node
class_name InventorySystem;


var _ArrowNum:int;
var _ArrowMax:int;

signal LoseArrowSignal();

func _ready():
	_ArrowNum = 15;


func _process(delta):
	pass


func LoseArrow()->void:
	_ArrowNum-=1;
	emit_signal("LoseArrowSignal");

func CheckArrow()->bool:
	if _ArrowNum >0:
		LoseArrow();
		return true;
	else:
		return false;
	print(_ArrowNum);

func _on_weapon_just_clicked():
	CheckArrow();
