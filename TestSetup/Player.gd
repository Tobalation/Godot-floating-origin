extends KinematicBody

# Super simple kinematic body controller

export var gravity = Vector3.DOWN * 9.8
export var speed = 2000.0
export var rot_speed = 0.85
export var turboFactor = 10.0

var velocity = Vector3.ZERO

func get_input(delta):
	# Reset velocity
	velocity = Vector3.ZERO
	
	# Obtain throttle and steering
	var throttle = Input.get_action_strength("forward") - Input.get_action_strength("back")
	var steering = Input.get_action_strength("left") - Input.get_action_strength("right")
	
	# Check turbo
	if Input.is_action_pressed("turbo"):
		throttle *= turboFactor
	
	# Move and rotate the body according to input
	velocity += -transform.basis.z * throttle * speed * delta
	
	rotate_y(rot_speed * steering * delta)
	
	# Check movement and emit particles based on input
	var movement = throttle + steering
	if movement > 0:
		$Visuals/DustParticlesL.emitting = true
		$Visuals/DustParticlesR.emitting = true
	else:
		$Visuals/DustParticlesL.emitting = false
		$Visuals/DustParticlesR.emitting = false

func _physics_process(delta):
	# Apply gravity
	velocity += gravity * delta
	# Apply inputs and move
	get_input(delta)
	velocity = move_and_slide(velocity, Vector3.UP)
