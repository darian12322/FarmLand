extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	if SingletoneAndOthers.settings_Out:
		SingletoneAndOthers.settings_Out = false
		get_tree().change_scene_to_file("res://Game/1Scene/5MainMenu/start.tscn")
	elif SingletoneAndOthers.settings_In:
		SingletoneAndOthers.settings_In = false
		get_tree().paused = false
		get_tree().change_scene_to_file("res://game.tscn")
