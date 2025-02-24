extends CharacterBody2D
class_name Kevin



var speed: float = 1.5 #1.5
var moving: bool = false
var last_direction: String = "Front"
var bypass: bool = false
var Bed_Node: Node = null


@onready var kevin_animated_sprite: AnimatedSprite2D = $KevinAnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if SingletoneAndOthers.start_In:
		SingletoneAndOthers.start_In = false
		position = Vector2(18, -15)
		
	if SingletoneAndOthers.In_house == true and SingletoneAndOthers.house2_bought == false:
		position = Vector2(-95, -88)
	elif SingletoneAndOthers.house2_bought == true and SingletoneAndOthers.In_house == true:
		position = Vector2(995.8046, 21.45732)
	else:
		position = Vector2(-37, -295)
	
	if SingletoneAndOthers.near_bed == true:
		position = Vector2(-53, -143)
	else:
		pass
	
	if SingletoneAndOthers.shop_home == true:	
		position = Vector2(140, -243)	
		SingletoneAndOthers.shop_home = false
	else:
		pass
		
	if SingletoneAndOthers.Out_schop == true:
		position = Vector2(282, -267)
		SingletoneAndOthers.Out_schop = false
	else:
		pass
	
	if SingletoneAndOthers.Out_Carpenter == true:
		position = Vector2(576, -169)
		SingletoneAndOthers.Out_Carpenter = false
	else:
		pass
	
	
	

func _process(_delta: float) -> void:
	
	
	
	
	
	
	
	if Bed_Node == null:
		Bed_Node = get_node_or_null("/root/House1Interface/GameObj/House1Interior/Bed")
	if Bed_Node:
		if Bed_Node.sleeping == true:
			
			kevin_animated_sprite.hide()
			position = Vector2(-53, -143)
			get_tree().paused = true
		else:
			kevin_animated_sprite.show()
			
	
	## --------------------------------------Input for movments----------------------------------------------------------------
	moving = false
	var is_moving_horizontal = false
	var is_moving_vertical = false

	if Input.is_action_pressed("Left") and SingletoneAndOthers.is_dialog == false:
		moving = true
		
		is_moving_horizontal = true
		position.x -= speed * _delta * 60
		kevin_animated_sprite.flip_h = true
		last_direction = "Side"
		
	if Input.is_action_pressed("Right") and SingletoneAndOthers.is_dialog == false:
		position.x += speed * _delta * 60
		kevin_animated_sprite.flip_h = false
		last_direction = "Side"
		moving = true
		is_moving_horizontal = true
		
	if Input.is_action_pressed("Up") and SingletoneAndOthers.is_dialog == false:
		position.y -= speed * _delta * 60
		moving = true
		is_moving_vertical = true
		last_direction = "Back"
		
	if Input.is_action_pressed("Down") and SingletoneAndOthers.is_dialog == false:
		position.y += speed * _delta * 60
		moving = true
		last_direction = "Front"
		is_moving_vertical = true
		
	## Make the character run verticaly with Side animation and others animations
	if is_moving_horizontal and is_moving_vertical:
		kevin_animated_sprite.play("Running(Side)")
		
	elif is_moving_horizontal:
		kevin_animated_sprite.play("Running(Side)")
	
	elif is_moving_vertical:
		if Input.is_action_pressed("Up"):
			kevin_animated_sprite.play("Running(Back)")
		elif Input.is_action_pressed("Down"):
			kevin_animated_sprite.play("Running(Front)")
			
	
		
	
			
			
	## Make the character face the last position
	if moving == false:
		if last_direction == "Side":
			kevin_animated_sprite.play("Idle(Side)")
		elif last_direction == "Back":
			kevin_animated_sprite.play("Idle(Back)")
		elif last_direction == "Front":
			kevin_animated_sprite.play("Idle(Front)")
	move_and_collide(velocity * _delta)
	## ----------------------------------------------------------------------------------------------------------------------
