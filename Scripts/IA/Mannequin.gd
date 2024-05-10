extends Character
class_name IA


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	pass

func _on_healh_system_death():
	_collisionBox.queue_free();
	hide();
	print(_collisionBox.disabled);
