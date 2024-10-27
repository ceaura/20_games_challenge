extends CharacterBody2D

@export var speed = 300

func _process(delta):
	velocity.y = 0
	
	if Input.is_action_pressed("right_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("right_down"):
		velocity.y = speed
	
	move_and_slide()
