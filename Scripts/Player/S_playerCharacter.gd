extends Character

@export var SPEED:float = 300;

var _direction:Vector2; 

func _physics_process(delta): #Movement
	if _direction:
		velocity = _direction.normalized() * SPEED;
		
	else:
		velocity = lerp(velocity,Vector2.ZERO,delta*50);
		velocity = Vector2(int(velocity.x),int(velocity.y));
	move_and_slide();

func _input(event: InputEvent):
	_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down");
	
	if(event.is_action_pressed("Shoot")):
		for nodes in get_children():
			nodes.emit_signal("Shoot");
