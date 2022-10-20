extends KinematicBody2D
var VELOCITY_VECTOR = Vector2(0, 50)
var player_id = null

func _ready():
	
	player_id = get_parent().player_id
	
	randomize()
		
	var rand_scale = randi() % 3 + 1
	self.scale.x = rand_scale
	self.scale.y = rand_scale

	self.position.y = -50
	self.position.x = randi() % 360 + 20
		
func _physics_process(delta):
	$Sprite.rotation_degrees += 1
		
	var collision = self.move_and_collide(VELOCITY_VECTOR * delta)
	if collision != null :
		if(collision.get_collider().get_collision_layer() == 4):
			collision.get_collider().queue_free()
			get_parent().player_score += 5
		if (collision.get_collider_id() == player_id):
			get_parent().player_health -= 10
		self.queue_free()
