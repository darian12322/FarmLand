extends StaticBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var TextBox_buyer = preload("res://Game/3UI/TextBox/text_box_buyer.tscn")
var ShopBuyer_Menu = preload("res://Game/3UI/Shop_Menu/shop_buyer_menu.tscn")
var near_counter: bool = false
var target_node: Node = null
var dialog: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_node = get_node("/root")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if near_counter == false:
		animated_sprite_2d.play("Idle")


func _on_button_pressed() -> void:
	if near_counter and SingletoneAndOthers.dialog_buyer == 0 and dialog == false:
		dialog = true
		inst_textbox()
	elif near_counter and SingletoneAndOthers.dialog_buyer == 1 and SingletoneAndOthers.bypass_for_dialog2 == false:
		SingletoneAndOthers.bypass_for_dialog2 = true
		inst_shop_menuB()

func _on_button_mouse_entered() -> void:
	if near_counter:
		animated_sprite_2d.play("Selected")


func _on_button_mouse_exited() -> void:
	animated_sprite_2d.play("Idle")


func _on_area_2d_body_entered(_body: Node2D) -> void:
	near_counter = true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	near_counter = false
	
func inst_textbox() -> void:
	var instance = TextBox_buyer.instantiate()
	target_node.add_child(instance)

func inst_shop_menuB() -> void:
	var instance = ShopBuyer_Menu.instantiate()
	target_node.add_child(instance)
