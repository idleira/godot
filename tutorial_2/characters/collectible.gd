extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var game_manager = %game_manager

func _on_body_entered(body):
	if (body.name == "main_character"):
		sprite.animation = "collected"
		queue_free()
		game_manager.add_point()
