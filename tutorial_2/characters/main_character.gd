extends CharacterBody2D

@onready var sprite = $Sprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		sprite.animation = "run"
	else:
		sprite.animation = "idle"
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite.animation = "jump"
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
	move_and_slide()
	var is_left = velocity.x < 0
	sprite.flip_h = is_left
	
