extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var game_manager = %game_manager

func _on_body_entered(body):
	if (body.name == "main_character"):
		sprite.animation = "collected"
		game_manager.add_point()


func _on_animated_sprite_2d_animation_finished():
	queue_free()
