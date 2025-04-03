extends CSGSphere3D

@onready var rear_target: Marker3D = %RearTarget

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = lerp(global_position, rear_target.global_position, 10.0 * delta)
