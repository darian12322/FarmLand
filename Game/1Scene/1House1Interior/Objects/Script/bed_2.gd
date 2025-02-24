extends StaticBody2D

var answer = preload("res://Game/3UI/EndScreen/asnwer.tscn")
var target_node: Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_node = get_node("/root")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	inst()
	get_tree().paused = true



func inst() -> void:
	var instance = answer.instantiate()
	target_node.add_child(instance)
