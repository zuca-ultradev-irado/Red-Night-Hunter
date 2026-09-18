extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	if body.name == "player":
		body.collectibles += 1
		print("Itens coletados: ", body.collectibles)
		queue_free()
