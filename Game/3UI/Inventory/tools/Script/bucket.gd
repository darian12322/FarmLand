extends Node2D



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



var Inventory_node: Node = null




func _ready() -> void:
	Inventory_node = get_node_or_null("/root/Game/GameUI/CanvasLayer/TextureRect")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if get_tree().current_scene.scene_file_path=="res://game.tscn" or get_tree().current_scene.scene_file_path=="res://house_1_interface.tscn" or get_tree().current_scene.scene_file_path=="res://shop_map.tscn" or get_tree().current_scene.scene_file_path=="res://shop_interior.tscn" or get_tree().current_scene.scene_file_path == "res://shop_carpenter_interior.tscn":
		if SingletoneAndOthers.bucket2_bought == false and SingletoneAndOthers.bucket3_bought == false:
			if SingletoneAndOthers.Bucket_liters == 4:
				animated_sprite_2d.play("Fill")
			elif SingletoneAndOthers.Bucket_liters == 3:
				animated_sprite_2d.play("3_4")
			elif SingletoneAndOthers.Bucket_liters == 2:
				animated_sprite_2d.play("2_4")
			elif SingletoneAndOthers.Bucket_liters == 1:
				animated_sprite_2d.play("1_4")
			else:
				animated_sprite_2d.play("Empty")
				
		elif SingletoneAndOthers.bucket2_bought and SingletoneAndOthers.bucket3Bypass_bought == false:
			if SingletoneAndOthers.Bucket_liters == 5:
				animated_sprite_2d.play("Fill2")
			elif SingletoneAndOthers.Bucket_liters == 4:
				animated_sprite_2d.play("4_5")
			elif SingletoneAndOthers.Bucket_liters == 3:
				animated_sprite_2d.play("3_5")
			elif SingletoneAndOthers.Bucket_liters == 2:
				animated_sprite_2d.play("2_5")
			elif SingletoneAndOthers.Bucket_liters == 1:
				animated_sprite_2d.play("1_5")
			else:
				
				animated_sprite_2d.play("Empty2")
		elif SingletoneAndOthers.bucket3_bought:
			if SingletoneAndOthers.Bucket_liters == 6:
				animated_sprite_2d.play("Fill3")
			elif SingletoneAndOthers.Bucket_liters == 5:
				animated_sprite_2d.play("5_6")
			elif SingletoneAndOthers.Bucket_liters == 4:
				animated_sprite_2d.play("4_6")
			elif SingletoneAndOthers.Bucket_liters == 3:
				animated_sprite_2d.play("3_6")
			elif SingletoneAndOthers.Bucket_liters == 2:
				animated_sprite_2d.play("2_6")
			elif SingletoneAndOthers.Bucket_liters == 1:
				animated_sprite_2d.play("1_6")
			else:
				
				animated_sprite_2d.play("Empty3")
			
