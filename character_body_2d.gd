extends CharacterBody2D

@export var speed := 100.0 # pixels per second
@export var turn_speed := 2.5 # radians per second
@onready var crash_timer: Timer = $CrashTimer

var health = 100.0

func _physics_process(delta: float) -> void:
	if health <= 0:
		$Sprite2D.visible = 0
		$Explosion.visible = 1
	
	if Input.is_action_pressed("up"):
		rotation -= turn_speed * delta # turn left over time
	if Input.is_action_pressed("down"):
		rotation += turn_speed * delta

	velocity = Vector2.UP.rotated(rotation) * speed

	var collision = move_and_collide(velocity * delta)
	
	if collision and collision.get_collider() and collision.get_collider() is StaticBody2D:
		take_damage()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		speed += 10
		PlayerStats.lap += 1
		print("Speed: ", speed)
		print("Health: ", health)

func take_damage():
	crash_timer.start()

func _on_crash_timer_timeout() -> void:
	health -= 10
