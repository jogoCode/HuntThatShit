extends Node
class_name HealthSystem;

@export var _hp:int;
@export var _maxHp:int;

@export var _hitParticle:PackedScene;

signal ApplyDamageEvent(damage);
signal Death();

func _ready():
	_maxHp = _hp;

func ApplyDamage(damage):
	if(_hp <= 0):
		Death.emit();
		return;
	else:
		_hp-= damage;
		_hp = clamp(_hp,0,_maxHp);
		for nodes in get_parent().get_children():
			nodes.emit_signal("SetVelocity",damage);

func createFx():
	var particle = _hitParticle.instantiate();
	particle.position = get_parent().global_position;
	particle.emitting = true;
	add_child(particle);

func _on_apply_damage_event(damage):
	ApplyDamage(damage);
	createFx();


func _on_hunger_system_hunger_is_empty():
	ApplyDamage(1);
