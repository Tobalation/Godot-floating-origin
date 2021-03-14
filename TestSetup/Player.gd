extends KinematicBody
# Super simple kinematic body controller
# Adapted from http://kidscancode.org/godot_recipes/3d/kinematic_body/

export var gravity = Vector3.DOWN * 9.8
export var speed = 20.0
export var rot_speed = 0.85
export var turboFactor = 10.0

var velocity = Vector3.ZERO

func get_input(delta):
	var input = false
	var vy = velocity.y
	velocity = Vector3.ZERO
	
	if Input.is_action_pressed("forward"):
		velocity += -transform.basis.z * speed
		input = true
	if Input.is_action_pressed("back"):
		velocity += transform.basis.z * speed
		input = true
	if Input.is_action_pressed("turbo"):
		velocity *= turboFactor
	
	if Input.is_action_pressed("right"):
		rotate_y(-rot_speed * delta)
		input = true
	if Input.is_action_pressed("left"):
		rotate_y(rot_speed * delta)
		input = true
	
	velocity.y = vy
	
	if input:
		$Visuals/DustParticlesL.emitting = true
		$Visuals/DustParticlesR.emitting = true
	else:
		$Visuals/DustParticlesL.emitting = false
		$Visuals/DustParticlesR.emitting = false

func _physics_process(delta):
	velocity += gravity * delta
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)
