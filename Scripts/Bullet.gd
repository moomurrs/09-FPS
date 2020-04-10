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
	if body is StaticBody:
		# remove bullet upon collision
		queue_free()
