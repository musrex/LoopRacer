extends Label

var credits = PlayerStats.credits

var sub_credit_count: int = 0

func _process(delta: float) -> void:
	sub_credit_count += 1
	
	if sub_credit_count == 100:
		sub_credit_count = 0
		credits += 1
	
	PlayerStats.credits = credits

	self.text = "Credits: " + str(credits)
