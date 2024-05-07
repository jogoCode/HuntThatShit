extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down");
	if direction:
		velocity = direction.normalized() * SPEED;
		
	else:
		velocity = lerp(velocity,Vector2.ZERO,delta*50);
		velocity = clamp(velocity,Vector2.ZERO,Vector2(1.79769e308,1.79769e308));

	print(velocity.length())
	
	move_and_slide();
