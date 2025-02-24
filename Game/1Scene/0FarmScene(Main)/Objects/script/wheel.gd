extends StaticBody2D



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_1: AnimatedSprite2D = $AnimatedSprite2D1

var Inventory_node: Node = null

var is_moving: bool = false
var near_area: bool = false










# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Inventory_node = get_node("/root/Game/GameUI/CanvasLayer/TextureRect")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if near_area == false:
		animated_sprite_2d.play("Idle")


func _on_detection_mouse_entered() -> void:
	if is_moving == false and near_area:
		animated_sprite_2d.play("Selected")
		animated_sprite_2d_1.play("Selected")


func _on_detection_mouse_exited() -> void:
	if is_moving == false and near_area:
		animated_sprite_2d.play("Idle")
		animated_sprite_2d_1.play("Idle")


func _on_detection_pressed() -> void:
	if near_area:
		if Inventory_node.bucket:
			if SingletoneAndOthers.bucket2_bought == false and SingletoneAndOthers.bucket3_bought == false:
				SingletoneAndOthers.Bucket_liters = 4
			elif SingletoneAndOthers.bucket2_bought and SingletoneAndOthers.bucket3Bypass_bought == false:
				SingletoneAndOthers.Bucket_liters = 5
			elif SingletoneAndOthers.bucket3_bought:
				SingletoneAndOthers.Bucket_liters = 6
		is_moving = true
		animated_sprite_2d.play("Moving")
		animated_sprite_2d_1.play("Idle")
	


func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.play("Idle")
	animated_sprite_2d_1.play("Idle")
	is_moving = false


func _on_trigger_area_body_entered(_body: Node2D) -> void:
	near_area = true


func _on_trigger_area_body_exited(_body: Node2D) -> void:
	near_area = false
