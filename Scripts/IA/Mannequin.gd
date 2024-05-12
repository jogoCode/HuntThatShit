extends Character
class_name IA


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	FindRandomDir();

func _physics_process(delta):
	move_and_slide();

func _on_healh_system_death():
	_collisionBox.queue_free();
	hide();


func FindRandomDir():
	var randDir:Vector2 = Vector2(randf_range(-99999,99999),randf_range(-99999,99999));
	velocity = randDir.normalized()*SPEED;
	await get_tree().create_timer(randf_range(1,10)).timeout;
	FindRandomDir();
