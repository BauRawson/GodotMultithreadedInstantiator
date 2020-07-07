extends Node

var camera

func _ready() -> void:
	camera = load("res://Camera.tscn").instance()
	add_child(camera)

func _unhandled_input(event : InputEvent) -> void:
	if event is InputEventMouseButton:
		var dropPlane  = Plane(Vector3(0, 1, 0), 0)
		var position3D = dropPlane.intersects_ray(
							camera.project_ray_origin(event.position),
								camera.project_ray_normal(event.position))
		var position_in_tiles = Vector2(int(position3D.x), int(position3D.z))
		instantiate_zombie_at_position(position_in_tiles)

func instantiate_zombie_at_position(position_in_tiles : Vector2) -> void:
		var zombie = load("res://zombie/zombie.tscn").instance()
		add_child(zombie)
		zombie.translation.x = position_in_tiles.x
		zombie.translation.z = position_in_tiles.y
