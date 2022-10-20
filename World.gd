extends Node2D
var time_rock = 0
var rock_time_limit = 5
var time_bullet = 0
var game_over = false

var player_health = 100
var player_id = null
var player_pos = Vector2.ZERO
var player_score = 0

const BULLET = preload("res://Bullet.tscn")
const ROCK = preload("res://Rock.tscn")

func _ready():
	player_id = $Player.get_instance_id()
	pass

func _process(delta):
	player_pos = $Player.position
	time_rock += delta
	time_bullet += delta
		
	if time_rock > rock_time_limit and !game_over:
		time_rock = 0
		if rock_time_limit > 0.1 : rock_time_limit -= 0.1
		var rock = ROCK.instance()
		self.add_child(rock)
	
	$Health.text = "Health : " + str(player_health)
	$Score.text = "Score : " + str(player_score)
	
	if player_health <= 0 : 
		game_over = true
		$GameOver.text = "Game Over!\nScore :" + str(player_score)
		$Player.queue_free()
		get_tree().paused = true
		
	if (Input.get_action_strength("ui_accept") != 0 and time_bullet > 0.5):
		time_bullet = 0
		var bullet = BULLET.instance()
		self.add_child(bullet)
		
