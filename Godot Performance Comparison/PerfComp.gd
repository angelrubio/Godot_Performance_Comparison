extends Node3D

@export var repeats : int
var frame_time_text : String
var frame_time_pre : float
var frame_time_post : float
var time1 : float
var times1 : float
var time2 : float
var times2 : float
var percentage : float

func _ready() -> void:
	time1 = 0
	time2 = 0
	times1 = 0
	times2 = 0
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_released("Function1"):
		frame_time_pre = Time.get_ticks_usec()/1000000.0
		for i in repeats:
			Function1()
		frame_time_post = Time.get_ticks_usec()/1000000.0
		print("Function1 ran " + str(repeats) + " times in " + str(frame_time_post - frame_time_pre) + " seconds")
		time1 += frame_time_post - frame_time_pre
		times1 += 1

	if Input.is_action_just_released("Function2"):
		frame_time_pre = Time.get_ticks_usec()/1000000.0
		for i in repeats:
			Function2()
		frame_time_post = Time.get_ticks_usec()/1000000.0
		print("         Function2 ran " + str(repeats) + " times in " + str(frame_time_post - frame_time_pre) + " seconds")
		time2 += frame_time_post - frame_time_pre
		times2 += 1

	if Input.is_action_just_released("Comparison"):
		var average1 : float = time1/times1
		var average2 : float = time2/times2
		if average1 < average2:
			var ratio : float = ((average1/average2))* 100
			print("\n Function 1 (ran "+str(times1)+" times) takes " + str(ratio) + " % of the time vs Function2 (ran "+str(times2)+" times) in the given circumstances")
		if average1 > average2:
			var ratio : float = ((average2/average1))* 100
			print("\n Function 2 (ran "+str(times2)+" times) takes " + str(ratio) + " % of the time vs Function1 (ran "+str(times1)+" times) in the given circumstances")
		if is_nan(average1+average2) || average1 == average2:
			print("\n They are equal or you didn't test them yet")

func Function1():
#	random_on_unit_sphere1()
	for1()
#	pass

func Function2():
#	random_on_unit_sphere2()
	for2()
#	pass

#################################
#								#
#		Test Function Zone		#
#								#
#################################

@export var arr : Array

func for1 () -> void:
	for i in arr.size():
		pass

func for2 () -> void:
	var count = arr.size()
	for i in count:
		pass

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
	return Vector3(randfn(0, 1), randfn(0, 1), randfn(0, 1)).normalized()

