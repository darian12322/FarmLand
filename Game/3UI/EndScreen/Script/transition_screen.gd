extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func change_scene() -> void:
	get_tree().paused = false
	if get_tree().current_scene.scene_file_path == "res://game.tscn":
		get_tree().change_scene_to_file("res://shop_map.tscn")
	else:
		SingletoneAndOthers.shop_home = true
		get_tree().change_scene_to_file("res://game.tscn")
		
func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()

func _Kevin_position() -> void:
	pass
