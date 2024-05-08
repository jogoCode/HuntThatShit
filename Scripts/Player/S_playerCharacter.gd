extends CharacterBody2D

@export var SPEED:float = 300;

func _physics_process(delta):

	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down");
	if direction:
		velocity = direction.normalized() * SPEED;
		
	else:
		velocity = lerp(velocity,Vector2.ZERO,delta*50);
		velocity = Vector2(int(velocity.x),int(velocity.y));

	print(velocity.length())
	
	move_and_slide();
