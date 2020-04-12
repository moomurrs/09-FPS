extends Spatial



func _on_Enemy_kill():
	print("kill player. Sent from signal")
	get_tree().change_scene("res://Scenes/Lost.tscn")


func _on_Enemy_locking():
	get_node("/root/Game/HUD/LockingStatus").visible = true
	$Timer.start()
	


func _on_Timer_timeout():
	get_node("/root/Game/HUD/LockingStatus").visible = false


func _on_Enemy2_kill():
	print("kill player. Sent from signal")
	get_tree().change_scene("res://Scenes/Lost.tscn")


func _on_Enemy2_locking():
	get_node("/root/Game/HUD/LockingStatus").visible = true
	$Timer.start()


func _on_Enemy3_kill():
	print("kill player. Sent from signal")
	get_tree().change_scene("res://Scenes/Lost.tscn")


func _on_Enemy3_locking():
	get_node("/root/Game/HUD/LockingStatus").visible = true
	$Timer.start()


func _on_Enemy4_kill():
	print("kill player. Sent from signal")
	get_tree().change_scene("res://Scenes/Lost.tscn")


func _on_Enemy4_locking():
	get_node("/root/Game/HUD/LockingStatus").visible = true
	$Timer.start()


func _on_Enemy5_kill():
	print("kill player. Sent from signal")
	get_tree().change_scene("res://Scenes/Lost.tscn")


func _on_Enemy5_locking():
	get_node("/root/Game/HUD/LockingStatus").visible = true
	$Timer.start()
