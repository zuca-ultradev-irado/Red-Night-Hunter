extends CharacterBody2D

@export var player: CharacterBody2D
@export var speed := 80.0
@export var attack_distance := 30.0

var dead := false
var attacking := false


func _physics_process(_delta):
	if player == null or dead:
		velocity = Vector2.ZERO
		return

	# Olha para o Player
	look_at(player.global_position)

	# Calcula a distância até o Player
	var distance = global_position.distance_to(player.global_position)

	# Se chegou perto, ataca
	if distance <= attack_distance:
		velocity = Vector2.ZERO

		if not attacking:
			attacking = true
			player.take_damage(1)

		return

	# Continua perseguindo
	var direction = global_position.direction_to(player.global_position)

	velocity = direction * speed
	move_and_slide()
	
	
func take_damage(amount: int):
	if dead:
		return

	# Para o Enemy quando ele morrer
	dead = true
	velocity = Vector2.ZERO
