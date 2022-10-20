extends KinematicBody2D
var VELOCITY = Vector2(0, -200)

func _ready():
	self.position = get_parent().player_pos #+ Vector2(0, -4)

func _physics_process(delta):
	var _collision = self.move_and_collide(VELOCITY * delta)
#	if collision != null :
#		print(collision)
#		self.queue_free()
