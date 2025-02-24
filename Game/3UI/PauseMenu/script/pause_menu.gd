extends Control


@onready var animated_sprite_2d: AnimatedSprite2D = $CanvasLayer/AnimatedSprite2D
@onready var resume: Button = $CanvasLayer/Resume
@onready var save: Button = $CanvasLayer/Save
@onready var settings: Button = $CanvasLayer/Settings
@onready var quit: Button = $CanvasLayer/Quit

var Notifications = preload("res://Game/3UI/Notifications/notifications.tscn")
var target_node: Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	target_node = get_node("/root")
	
	animated_sprite_2d.show()
	animated_sprite_2d.play("Open")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("Pause"):
		if SingletoneAndOthers.pause_open:
			animated_sprite_2d.play("Close")
			resume.hide()
			save.hide()
			settings.hide()
			quit.hide()
		
		
		
		
		

	


func _on_animated_sprite_2d_animation_finished() -> void:
	if SingletoneAndOthers.pause_open:
		resume.show()
		save.show()
		settings.show()
		quit.show()
	if SingletoneAndOthers.pause_open == false:
		SingletoneAndOthers.open_bypass = false
		queue_free()
		

#--------------------------------button pressed-----------------------


func _on_resume_pressed() -> void:
	SingletoneAndOthers.pause_open = false
	animated_sprite_2d.play("Close")
	resume.hide()
	save.hide()
	settings.hide()
	quit.hide()
	get_tree().paused = false
	
	
	
	
func _on_save_pressed() -> void:
	SingletoneAndOthers.save_game("user://tilemap_data.tres")
	inst_notif()
		

func _on_settings_pressed() -> void:
	SingletoneAndOthers.open_bypass = false
	SingletoneAndOthers.settings_In = true
	queue_free()
	get_tree().change_scene_to_file("res://Game/1Scene/6Settings/settings.tscn")


func _on_quit_pressed() -> void:
	SingletoneAndOthers.open_bypass = false
	get_tree().change_scene_to_file("res://Game/1Scene/5MainMenu/start.tscn")
	queue_free()
	

#-----------------------------------------------------------------------

## Instantiate notifications

func inst_notif() -> void:
	var instance = Notifications.instantiate()
	target_node.add_child(instance)
