extends Node2D


var Transition_Screen = preload("res://Game/3UI/EndScreen/transition_screen.tscn")
var target_node: Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_node = get_node("/root")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_tp_body_entered(_body: Node2D) -> void:
	inst_transition()
	get_tree().paused = true



func inst_transition() -> void:
	var instance = Transition_Screen.instantiate()
	target_node.add_child(instance)
