extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if actor.GetActualLifeState() == Character.LifeState.ALIVE:
		return SUCCESS;
	else:
		return FAILURE;

