extends CanvasLayer


@onready var end_screen_death: Timer = $EndScreenDeath





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SingletoneAndOthers.save_game("user://tilemap_data.tres")
	SingletoneAndOthers.TimePassedForRNG = true
	end_screen_death.start()
	get_tree().change_scene_to_file("res://house_1_interface.tscn")
	get_tree().paused = true
	SingletoneAndOthers.near_bed = true
	Clock.hour = 9
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SingletoneAndOthers.TimePassedForRNG:
		SingletoneAndOthers.TimePassedForRNG = false


func _on_end_screen_death_timeout() -> void:
	get_tree().paused = false
	SingletoneAndOthers.Days += 1
	SingletoneAndOthers.time_passed = true
	queue_free()
	
	SingletoneAndOthers.near_bed = false
