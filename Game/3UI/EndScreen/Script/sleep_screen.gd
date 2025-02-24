extends CanvasLayer


@onready var label: Label = $Label




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label_update()


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
	

func _custom_func(_anim_Name: StringName) -> void:
	Clock.hour = 8
	Clock.minute = 0
	SingletoneAndOthers.time_passed = true
	SingletoneAndOthers.TimePassedForRNG = true
func label_update() -> void:
	label.text = "Day " + str(SingletoneAndOthers.Days)
