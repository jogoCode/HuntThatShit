extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	actor._hungerSystem.SearchNearestFood();
	goToTarget(actor);
	print(actor.global_position.distance_to(actor._target.global_position))
	if(actor.global_position.distance_to(actor._target.global_position) < 35):
		actor._target.queue_free();
		actor._hungerSystem.AddHunger(50);
	if actor._target == null:
		return SUCCESS

func goToTarget(actor):
	var direction = Vector3();
	actor._nav.target_position = actor._target.global_position;
	direction = actor._nav.get_next_path_position()-actor.global_position;
	direction = direction.normalized();
	actor.velocity = direction*actor.SPEED;
