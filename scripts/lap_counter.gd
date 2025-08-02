extends Label

func _process(delta: float) -> void:
	self.text = "Lap: " + str(PlayerStats.lap)
