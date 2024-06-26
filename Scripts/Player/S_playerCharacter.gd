extends Character
class_name PlayerCharacter

func _ready():
	super._ready();

func _physics_process(delta): #Movement
	if _direction:
		velocity = _direction.normalized() * SPEED;
	else:
		velocity = lerp(velocity,Vector2.ZERO,delta*50);
		velocity = Vector2(int(velocity.x),int(velocity.y));
	move_and_slide();


func _on_healh_system_death():
	_collisionBox.disabled = true;
	hide();
