extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if(actor._hungerSystem._hunger <= 0):
		if actor._target != null:
			return SUCCESS
	else:
		return FAILURE
	
