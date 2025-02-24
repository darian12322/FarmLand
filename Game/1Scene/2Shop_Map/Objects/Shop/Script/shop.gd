extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var near_door: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if near_door == false:
		animated_sprite_2d.play("Idle")


func _on_button_mouse_entered() -> void:
	if near_door:
		animated_sprite_2d.play("Selected")
	

func _on_button_mouse_exited() -> void:
	if near_door:
		animated_sprite_2d.play("Idle")


func _on_trigger_arrea_body_entered(_body: Node2D) -> void:
	near_door = true


func _on_trigger_arrea_body_exited(_body: Node2D) -> void:
	near_door = false


func _on_button_pressed() -> void:
	if near_door:
		get_tree().change_scene_to_file("res://shop_interior.tscn")
