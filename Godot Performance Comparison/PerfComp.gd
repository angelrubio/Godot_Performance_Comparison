extends Node3D

@export var repeats : int
var frame_time_text : String
var frame_time_pre : float
var frame_time_post : float
var dot_path = "res://dot.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_released("Function1"):
		frame_time_pre = Time.get_ticks_usec()/1000000.0
		for i in repeats:
			Function1()
		frame_time_post = Time.get_ticks_usec()/1000000.0
		print("Took " + str(frame_time_post - frame_time_pre) + " seconds to do Function1 " + str(repeats) + " times")

	if Input.is_action_just_released("Function2"):
		frame_time_pre = Time.get_ticks_usec()/1000000.0
		for i in repeats:
			Function2()
		frame_time_post = Time.get_ticks_usec()/1000000.0
		print("Took " + str(frame_time_post - frame_time_pre) + " seconds to do Function2 " + str(repeats) + " times")

func Function1():
#	var dot = load(dot_path).instantiate()
#	get_tree().root.add_child(dot)
#	dot.position = random_on_unit_sphere1() - Vector3(-2,0,0)
	random_on_unit_sphere1()
#	pass

func Function2():
#	var dot = load(dot_path).instantiate()
#	get_tree().root.add_child(dot)
#	dot.position = random_on_unit_sphere2() - Vector3(2,0,0)
	random_on_unit_sphere2()
#	pass

func random_on_unit_sphere1 () -> Vector3:
	var x1 = randf_range (-1, 1)
	var x2 = randf_range (-1, 1)
	while x1*x1 + x2*x2 >= 1:
		x1 = randf_range(-1, 1)
		x2 = randf_range(-1, 1)
	var random_pos_on_unit_sphere = Vector3 (
	2 * x1 * sqrt(1 - x1*x1 - x2*x2),
	2 * x2 * sqrt(1 - x1*x1 - x2*x2),
	1 - 2 * (x1*x1 + x2*x2))
	return random_pos_on_unit_sphere

func random_on_unit_sphere2 () -> Vector3:
	return Vector3(randfn(0, 1), randfn(0, 1), randfn(0, 1))

