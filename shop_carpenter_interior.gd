extends Node
# a script different from others

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_tp_body_entered(_body: Node2D) -> void:
	SingletoneAndOthers.Out_Carpenter = true
	call_deferred("change_scene")


func change_scene() -> void:
	get_tree().change_scene_to_file("res://shop_map.tscn")
