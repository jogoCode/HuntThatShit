extends ActionLeaf


func tick(actor, blackboard: Blackboard):
	FindRandomDir(actor);
	return SUCCESS

func FindRandomDir(actor):
	var randDir:Vector2 = Vector2(randf_range(-99999,99999),randf_range(-99999,99999));
	actor.velocity = randDir.normalized()*actor.SPEED;	
