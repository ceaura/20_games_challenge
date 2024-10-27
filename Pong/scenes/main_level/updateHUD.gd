extends Node2D

var initialTime
var leftScore = 0
var rightScore = 0

@export var ball_scene: PackedScene

@onready var lb_time_value = %LbTimeValue
@onready var lb_rightScore_value = %LbRightScore
@onready var lb_leftScore_value = %LbLeftScore
@onready var spawer_ball = %SpawerBall

# Called when the node enters the scene tree for the first time.
func _ready():
	initialTime = Time.get_unix_time_from_system()
	spawn_ball()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_time_label()
	update_score_label()

func update_score_label():
	lb_rightScore_value.text = str(rightScore)
	lb_leftScore_value.text = str(leftScore)

func update_time_label():
	var elapsed_time = Time.get_unix_time_from_system() - initialTime
	var minutes = int(elapsed_time) / 60
	var secondes = int(elapsed_time) % 60
	var formatted_time = "%02d:%02d" % [minutes, secondes]
	
	lb_time_value.text = formatted_time

# Left border
func _on_left_body_entered(body):
	if body is Ball : 
		rightScore += 1
		body.queue_free()
		spawn_ball()		

# Right border
func _on_right_body_entered(body):
	if body is Ball : 
		leftScore += 1
		body.queue_free()
		spawn_ball()

func spawn_ball():
	var ball_instance = ball_scene.instantiate()
	add_child(ball_instance)
	ball_instance.position.x = spawer_ball.position.x
	ball_instance.position.y = spawer_ball.position.y
