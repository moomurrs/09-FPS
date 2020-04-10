extends KinematicBody

onready var Camera = $Pivot/Camera

var velocity = Vector3()
var gravity = -9.8
var speed = 8
var mouse_sensitivity = 0.002
var mouse_range = 1.2
var jump = 10
var jumping = false
var Bullet = preload("res://Scenes/Bullet.tscn")
onready var Bullets = get_node("/root/Game/HUD/Bullets")
var bulletCount = 20

func _ready():
	# disable mosue cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Bullets.text = "20/20"
	

# return player location based on input
func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	if Input.is_action_pressed("jump"):
		jumping = true
	input_dir = input_dir.normalized()
	return input_dir
	

func _physics_process(delta): 
	velocity.y += gravity * delta
	# process player location
	var desired_velocity = get_input() * speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	
	if jumping and is_on_floor():
		velocity.y = jump
		
	
	velocity = move_and_slide(velocity, Vector3.UP, true)
	jumping = false

func _unhandled_input(event):
	# only check if the mouse is moved, instead of polling
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)
		
	if event.is_action_pressed("shoot"):
		bulletCount -= 1
		if bulletCount >= 0:
			Bullets.text = str(bulletCount) + "/20"
			var bullet = Bullet.instance()
			bullet.start($Pivot/Muzzle.global_transform)
			get_node("/root/Game/Bullets").add_child(bullet)
		
