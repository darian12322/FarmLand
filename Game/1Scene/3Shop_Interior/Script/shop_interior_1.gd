extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $Counter/AnimatedSprite2D

var TextBox = preload("res://Game/3UI/TextBox/text_box.tscn")
var ShopMenu = preload("res://Game/3UI/Shop_Menu/shop_menu.tscn")
var near_shop: bool = false
var target_node: Node = null
var current_d: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_node = get_node("/root")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if near_shop == false:
		animated_sprite_2d.play("Idle")










func _on_area_2d_body_entered(_body: Node2D) -> void:
	SingletoneAndOthers.Out_schop = true
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://shop_map.tscn")




func _on_button_mouse_entered() -> void:
	if near_shop:
		animated_sprite_2d.play("Selected")


func _on_button_mouse_exited() -> void:
	
	animated_sprite_2d.play("Idle")


func _on_button_pressed() -> void:
	if near_shop and SingletoneAndOthers.dialog_seller == 0 and current_d == false:
		current_d = true
		
		inst_textbox()
	elif near_shop and SingletoneAndOthers.bypass_for_dialog == false and SingletoneAndOthers.dialog_seller == 1:
		
		SingletoneAndOthers.bypass_for_dialog = true
		inst_shopmenu()

func _on_trigger_area_body_entered(_body: Node2D) -> void:
	near_shop = true
	

func _on_trigger_area_body_exited(_body: Node2D) -> void:
	near_shop = false
	
	
func inst_textbox() -> void:
	var instance = TextBox.instantiate()
	target_node.add_child(instance)

func inst_shopmenu() -> void:
	var instance = ShopMenu.instantiate()
	target_node.add_child(instance)
