extends Area

var speed = 15
var velocity = Vector3()


func _ready():
	pass

func start(start_from):
	transform = start_from
	velocity = transform.basis.z * speed
	

func _physics_process(delta):
	transform.origin += velocity * delta
	
	

# remove the bullet after seconds of lifetime
func _on_Timer_timeout():
	queue_free()

# bullet hit something
func _on_Bullet_body_entered(body):
	
	if body.get_parent().name == "Enemies":
		get_node("/root/Global").totalEnemies -= 1
		print("enemy hit")
		body.queue_free()
		self.queue_free()
		print(get_node("/root/Global").totalEnemies)
		if get_node("/root/Global").totalEnemies == 0:
			get_tree().change_scene("res://Scenes/Win.tscn")
	
	if body is StaticBody:
		
		# remove bullet upon collision
		queue_free()
	
