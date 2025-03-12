extends CharacterBody3D

signal ship_hit
@export var speed = 14

var target_velocity = Vector3.ZERO

func on_hit():
	ship_hit.emit()
	#print("ship hit")
	

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("p2_right"):
		direction.x += 1
	if Input.is_action_pressed("p2_left"):
		direction.x -= 1
	if Input.is_action_pressed("p2_back"):
		direction.z += 1
	if Input.is_action_pressed("p2_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$pivot.basis = Basis.looking_at(direction)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
