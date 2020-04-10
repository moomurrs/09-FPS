extends Spatial

var score = 0
onready var Score = get_node("/root/Game/HUD/Score")
onready var Bullets = get_node("/root/Game/HUD/Bullets")

func _ready():
	pass
	
func update_score(s):
	score += s
	Score.text = "Score " + str(score)


