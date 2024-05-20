extends ConditionLeaf


func tick(actor, blackboard: Blackboard):
	if(actor._hungerSystem._hunger <= 0):
		return SUCCESS
	else:
		return FAILURE
