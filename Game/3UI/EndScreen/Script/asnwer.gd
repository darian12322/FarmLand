extends CanvasLayer

@onready var animation_tree: AnimationPlayer = $AnimationTree

@onready var panel: Panel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_end_pressed() -> void:
	SingletoneAndOthers.menu = true
	animation_tree.play("1")


func _on_continue_pressed() -> void:
	get_tree().paused = false
	queue_free()


func _on_button_pressed() -> void:
	SingletoneAndOthers.ending = true
	SingletoneAndOthers.start_In = true
	SingletoneAndOthers.delete_save("user://tilemap_data.tres")
	get_tree().change_scene_to_file("res://Game/1Scene/5MainMenu/start.tscn")
	queue_free()
	
