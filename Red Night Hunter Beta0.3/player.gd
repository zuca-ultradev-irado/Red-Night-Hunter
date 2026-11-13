extends CharacterBody2D

@export var speed := 150.0
@export var max_health := 1

var health: int
var dead := false
var has_weapon := false

@onready var death_screen = get_tree().current_scene.get_node_or_null("DeathScreen")


func _ready():
	health = max_health
	
	if death_screen:
		death_screen.visible = false


func _physics_process(_delta):
	if dead:
		velocity = Vector2.ZERO
		return

	var direction := Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	velocity = direction * speed
	move_and_slide()

	look_at(get_global_mouse_position())


func _input(event):
	if dead:
		if event is InputEventKey:
			if event.pressed and event.keycode == KEY_R:
				get_tree().reload_current_scene()

		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			attack()


func take_damage(amount: int):
	if dead:
		return

	health -= amount

	print("PLAYER TOMOU DANO! Vida: ", health)

	if health <= 0:
		die()


func die():
	dead = true
	velocity = Vector2.ZERO

	print("PLAYER MORREU!")

	if death_screen:
		death_screen.visible = true


func pick_up_weapon():
	has_weapon = true

	var weapon = get_node_or_null("Weapon")

	if weapon:
		weapon.visible = true


func attack():
	if not has_weapon:
		return

	var attack_area = get_node_or_null("Weapon/AttackArea")

	if attack_area == null:
		return

	for body in attack_area.get_overlapping_bodies():
		if body == self:
			continue
		if body.has_method("take_damage"):
			body.take_damage(1)
