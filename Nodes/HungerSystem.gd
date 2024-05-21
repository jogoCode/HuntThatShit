extends Node
class_name HungerSystem

@export var _hunger:float;
var _foodType;
var _consumeValue = 10;
var _consumeRate = 5;

var _foodsLibrary:Array;
@export var _hungerField:Area2D;

signal ModifyConsumeValues(value,rate);
signal HungerIsEmpty();

func _ready():
	consumeHunger();

func consumeHunger():
	await get_tree().create_timer(_consumeRate).timeout;
	_hunger -= _consumeValue;
	_hunger = clamp(_hunger,0,99999);
	print("Faim:",_hunger);
	if(_hunger <= 0):
		HungerIsEmpty.emit();
	consumeHunger();

func SearchNearestFood():
	if _foodsLibrary != null:
		for foods in _foodsLibrary:
			if foods != null:
				get_parent()._target = foods;

func SetConsumeValues(value,rate):
	_consumeValue = value;
	_consumeRate = rate;

func AddHunger(value):
	_hunger+= value;

func _on_hunger_field_body_entered(body):
	print(body.name);
	if(body.get_node("Pickable")):
		var food= body.get_node("Pickable");
		if food._type == _foodType:
			_foodsLibrary.insert(_foodsLibrary.size(),body);
