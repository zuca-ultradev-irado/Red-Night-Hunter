extends CharacterBody2D

@export var player: CharacterBody2D
@export var speed := 80.0

func _physics_process(_delta):
	if player == null:
		return

	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
