extends Spatial

# Amount of distance before shifting
export(float) var threshold : float = 2000.0

# Reference to main camera
onready var camera : Camera = get_viewport().get_camera()

# Function to contain origin shift logic
func shift_origin() -> void:
	# Shit everything by the offset of the camera's position
	global_transform.origin -= camera.global_transform.origin
	print("World shifted to " + str(global_transform.origin))

func _physics_process(delta: float) -> void:
	# Set the camera to check to be the current camera
	camera = get_viewport().get_camera()
	# Check distance of world from camera and shift if greater than threshold
	if(camera.global_transform.origin.length() > threshold && camera != null):
		shift_origin()
