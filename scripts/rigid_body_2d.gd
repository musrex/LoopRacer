extends RigidBody2D

@export var speed = .1
@export var turn_speed = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_pressed("up"):
		angular_velocity = -turn_speed
	elif Input.is_action_pressed("down"):
		angular_velocity = turn_speed
	else:
		angular_velocity = 0.0
	
	var forward_direction = Vector2.UP.rotated(rotation)
	
	#linear_velocity = forward_direction *speed
	apply_impulse(forward_direction * speed)

#func _on_area_2d_body_entered(body: Node2D) -> void:
#	speed += 10
