extends StaticBody2D


@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var button: Button = $Button
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var animated_sprite_2d: AnimatedSprite2D = $Animated_sprite2d

var near_door: bool = false
var select: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if near_door == false and SingletoneAndOthers.house2_bought == false:
		animated_sprite_2d.play("Idle")
	
	elif SingletoneAndOthers.house2_bought and select == false:
		sprite_2d.play("House2")
		animated_sprite_2d.play("House2Idle")
	if near_door == false and SingletoneAndOthers.house2_bought:
			animated_sprite_2d.play("House2Idle")
		
	if SingletoneAndOthers.house2_bought:
		animated_sprite_2d.position.y = 54
		sprite_2d.position.y = 54
		button.position = Vector2(10, 87)
		collision_shape_2d.scale = (Vector2(2.4, 1.3))

func _on_button_pressed() -> void:
	if near_door:
		SingletoneAndOthers.In_house = true
		SingletoneAndOthers.save_game("user://tilemap_data.tres")
		get_tree().change_scene_to_file("res://house_1_interface.tscn")
	
	



func _on_button_mouse_entered() -> void:
	if near_door and SingletoneAndOthers.house2_bought == false:
		animated_sprite_2d.play("Selected")
	elif near_door and SingletoneAndOthers.house2_bought:
		select = true
		animated_sprite_2d.play("House2Selected")

func _on_button_mouse_exited() -> void:
	if near_door and SingletoneAndOthers.house2_bought == false:
		animated_sprite_2d.play("Idle")
	elif near_door and SingletoneAndOthers.house2_bought:
		select = false
		animated_sprite_2d.play("House2Idle")


func _on_trigger_area_body_entered(_body: Node2D) -> void:
	near_door = true


func _on_trigger_area_body_exited(_body: Node2D) -> void:
	near_door = false
