extends CanvasLayer

@onready var label: Label = $TextureRect/MarginContainer/Label
@onready var timer: Timer = $Timer

var current_length: int = 0
var text_length: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.set_visible_characters(0)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = "Ah, we meet again... Tell me, do you desire to strike a deal?"
	text_length = label.text.length()	
	
func _on_timer_timeout() -> void:
	
	if current_length < text_length:
		current_length += 1
		label.set_visible_characters(current_length)

func _timerstart() -> void:
	timer.start()


func _on_button_pressed() -> void:
	SingletoneAndOthers.ending = true
	get_tree().change_scene_to_file("res://Game/1Scene/5MainMenu/start.tscn")
