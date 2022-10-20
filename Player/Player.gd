extends KinematicBody2D

var velocity = Vector2.ZERO
var health = 100

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		
	if input_vector != Vector2.ZERO:
		velocity = input_vector * 5000 * delta
	else:
		velocity = Vector2.ZERO
		
	move_and_slide(velocity)
		
