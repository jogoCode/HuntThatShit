extends Node2D

var _owner:Character;
var _direction:Vector2;
var _speed = 500;
const FRICTION = 200;

func _ready():
	_direction = Vector2.RIGHT.rotated(rotation);

func _process(delta):
	var velocity = _direction*_speed*delta;;
	global_position += velocity;
	_speed-=FRICTION*delta;
	_speed = clamp(_speed,0,1000000);


func _on_hurt_box_body_entered(body):
	if(body != get_parent()):
		var distToEnemy = position.distance_to(_owner.global_position);
		for children in body.get_children():
			children.emit_signal("ApplyDamageEvent",computeDamage(_speed,5,distToEnemy));
		queue_free();


func computeDamage(speed,baseDamage,distanceToEnemy)->float:
	var finalDamage = speed*baseDamage/distanceToEnemy;
	print('VFdamage = ',finalDamage)
	return finalDamage;
