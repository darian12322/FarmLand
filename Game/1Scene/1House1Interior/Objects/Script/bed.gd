extends StaticBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var button: Button = $Button
@onready var timer: Timer = $Timer

var sleeping: bool = false
var SleepScreen = preload("res://Game/3UI/EndScreen/sleep_screen.tscn")
var target_node: Node = null



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_node = get_node("/root")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SingletoneAndOthers.TimePassedForRNG:
		SingletoneAndOthers.TimePassedForRNG = false


func _on_button_pressed() -> void:
	
	SingletoneAndOthers.Days += 1
	inst_Screen()
	sleeping = true
	timer.start()
	animated_sprite_2d.play("Sleep")
	animated_sprite_2d_2.play("Sleep")
	

func _on_timer_timeout() -> void:
	animated_sprite_2d.play("Idle")
	animated_sprite_2d_2.play("Idle")
	sleeping = false
	get_tree().paused = false
	
func inst_Screen() -> void:
	var instance = SleepScreen.instantiate()
	target_node.add_child(instance)
