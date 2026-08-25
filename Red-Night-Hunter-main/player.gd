extends CharacterBody2D

@export var speed := 150.0
@export var max_health := 1

var health := max_health


func _physics_process(_delta):
	var direction := Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	velocity = direction * speed
	move_and_slide()

	look_at(get_global_mouse_position())


func take_damage(amount: int):
	health -= amount

	if health <= 0:
		die()


func die():
	queue_free()
