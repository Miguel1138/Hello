extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$SoundJump.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction > 0 :
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play()
		velocity.x = direction * SPEED
	elif direction < 0 :
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	move_and_slide()
