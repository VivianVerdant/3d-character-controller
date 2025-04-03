extends Marker3D

@onready var player = $"../.."
@onready var marker = $"../../marker"
@onready var target = $"../../marker/IndependantTarget"

@export var translation_speed: float = 5.0
@export var rotaiton_speed: float = 5.0
@export var jump_rotation_amount: float = -30.0

func _process(delta: float) -> void:
	marker.rotation.x = player.velocity.y / jump_rotation_amount
	global_position = lerp(global_position, target.global_position, translation_speed * delta)
	global_position.y = lerp(global_position.y, target.global_position.y, translation_speed * 10.0 * delta)
	global_rotation.x = target.global_rotation.x
	global_basis = global_basis.orthonormalized()
	target.global_basis = target.global_basis.orthonormalized()
	#global_basis = lerp(global_basis, target.global_basis, rotaiton_speed * delta)
	global_basis = global_basis.slerp(target.global_basis, rotaiton_speed * delta).orthonormalized()
