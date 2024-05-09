extends Node
class_name HealhSystem;

@export var _hp:int;
@export var _maxHp:int;

signal ApplyDamageEvent(damage);

func _ready():
	_maxHp = _hp;


func ApplyDamage(damage):
	if(_hp <= 0):
		get_parent().hide();
	print(_hp)
	_hp-= damage;
	_hp = clamp(_hp,0,_maxHp);



func _on_apply_damage_event(damage):
	ApplyDamage(damage);
