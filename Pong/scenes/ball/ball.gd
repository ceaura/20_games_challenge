extends RigidBody2D
class_name  Ball

func _ready():
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	apply_impulse(Vector2(3,0))
