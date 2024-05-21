extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	actor._hungerSystem.SearchNearestFood();
	goToFood(actor);
	if actor._target == null:
		return SUCCESS

func goToFood(actor):
	if actor._target != null:
		print(actor.global_position.distance_to(actor._target.global_position))
		# --- Nav mesh action ---------------
		var direction = Vector3();
		actor._nav.target_position = actor._target.global_position;
		direction = actor._nav.get_next_path_position()-actor.global_position;
		direction = direction.normalized();
		actor.velocity = direction*actor.SPEED;
		# --- Check if target is in side of actor -----------------
		if(actor.global_position.distance_to(actor._target.global_position) < 50):
			if(actor._target is Character):
				print("OOOOHHH YEAAAAH");
				for children in actor._target.get_children():
					children.emit_signal("ApplyDamageEvent",50);
			else:
				actor._target.queue_free();
			actor._hungerSystem.AddHunger(100);	
