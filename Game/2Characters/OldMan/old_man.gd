extends CharacterBody2D

@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var button: Button = $Button
@onready var animated_sprite_2d: AnimatedSprite2D = $Path2D/PathFollow2D/AnimatedSprite2D
@onready var old_man: CharacterBody2D = $"."


var text_box = preload("res://Game/3UI/TextBox/text_box_oldman.tscn")
var target_node: Node = null
var speed = 0.15
func _ready() -> void:
	target_node = get_node("/root")

func _process(delta: float) -> void:
	if SingletoneAndOthers.pathover == true:
		button.disabled = true
		old_man.hide()
		collision_shape_2d.disabled = true
	if SingletoneAndOthers.start_path:
		
		collision_shape_2d.disabled = true
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("Run")
		path_follow_2d.progress_ratio += delta * speed
		
	if path_follow_2d.progress_ratio >= 1.0:
		SingletoneAndOthers.start_path = false
		SingletoneAndOthers.pathover = true
		queue_free()
		
		
func _on_button_pressed() -> void:
	if SingletoneAndOthers.dialog_oldm == 0:
		inst_text()
	elif SingletoneAndOthers.dialog_oldm == 2:
		inst_text()
	elif SingletoneAndOthers.dialog_oldm == 4:
		inst_text()


func inst_text() -> void:
	var instance = text_box.instantiate()
	target_node.add_child(instance)
