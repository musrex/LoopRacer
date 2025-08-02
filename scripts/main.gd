extends Node2D

@onready var shop_scene = preload("res://scenes/shop.tscn")

var shopping = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_shop_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		shopping = true
		var shop_instance = shop_scene.instantiate()
		var ui = get_node("UI")
		ui.add_child(shop_instance)
		get_tree().paused = true
		
		
