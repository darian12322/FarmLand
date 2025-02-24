extends CanvasLayer
@onready var button: Button = $Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SingletoneAndOthers.ending:
		button.disabled = true


func _on_button_pressed() -> void:
	SingletoneAndOthers.start_In = true
	get_tree().paused = false
	get_tree().change_scene_to_file("res://game.tscn")
	

func _on_settings_pressed() -> void:
	SingletoneAndOthers.settings_Out = true
	get_tree().change_scene_to_file("res://Game/1Scene/6Settings/settings.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
