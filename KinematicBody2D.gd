extends KinematicBody2D

class_name Player


export var rychlost = 250
export var gravitace = 1300
export var skok = -575
var pohyb = Vector2()
var smer = 1



var scenastr = preload("res://strela.tscn")


func _physics_process(delta):
	if Input.is_action_just_pressed("menu"):
		get_paused(true)
		else:
			get_paused(false)
	pohyb.y += gravitace*delta
	if is_on_floor():
		if Input.is_action_pressed("vlevo"):
			pohyb.x = -rychlost
			$Animak.flip_h = true
			$Animak.play("Run")
			smer = -1
		elif Input.is_action_pressed("vpravo"):
			pohyb.x = rychlost
			$Animak.flip_h = false
			$Animak.play("Run")
			smer = 1
		else:
			pohyb.x = 0
			$Animak.play("Idle")
		if Input.is_action_pressed("nahoru"):
			pohyb.y = skok
			$Animak.play("Jump")
			$Vyskok.play()
	else:
		if pohyb.y > 0:
			$Animak.play("Fall")
	if Input.is_action_just_pressed("Hod"):
		var throwing = scenastr.instance()
		if smer > 0:	
			throwing.position = $hazenip.global_position
		elif smer < 0:
			throwing.position = $hazenil.global_position
		throwing.rychlost *= smer
		$"../Hody".add_child(throwing)
	pohyb = move_and_slide(pohyb,Vector2(0,-1))
