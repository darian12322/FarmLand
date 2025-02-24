extends Node2D


@onready var tile_map: TileMap = %TileMap
@onready var old_man_v_2: CharacterBody2D = $OldManV2
@onready var collision_shape_2d: CollisionShape2D = $OldManV2/CollisionShape2D

var secret2 = preload("res://Game/3UI/EndScreen/secret_2.tscn")
var Inventory_Node: Node = null
var selected: bool = false
var Bselected: bool = false
var Cselected: bool = false
var CCselecte: bool = false
var new_tile_id: int = 1
var water_tile_id: int = 2
var carrots_tile_id: int = 3
var ccarrots_tile_id: int = 4
var Allowed: bool = false
var Transition_Screen = preload("res://Game/3UI/EndScreen/transition_screen.tscn")
var target_node: Node = null


func _ready() -> void:
	Inventory_Node = get_node("/root/Game/GameUI/CanvasLayer/TextureRect")
	target_node = get_node("/root")


func _physics_process(_delta: float) -> void:
	if SingletoneAndOthers.pathover:
		tile_map.set_cell(4, Vector2i(7, 3), -1)
		tile_map.set_cell(4, Vector2i(7, 4), -1)
	
	
	
	
	
	
	if SingletoneAndOthers.pathover:
		old_man_v_2.show()
		collision_shape_2d.disabled = false
	if SingletoneAndOthers.time_passed == true:
		
		SingletoneAndOthers.time_passed = false
		for cell in tile_map.get_used_cells_by_id(3):
			var carrot = cell
			
			SingletoneAndOthers.time_passed = false
			if cell:
				tile_map.set_cell(1, carrot, ccarrots_tile_id, Vector2(0, 0))
				tile_map.set_cell(0, carrot, ccarrots_tile_id, Vector2(0, 0))
				tile_map.set_cell(3, carrot, ccarrots_tile_id, Vector2(0, 0))
				
func _input(event: InputEvent) -> void:

	
	if event.is_action_pressed("1"):
		
		if selected == false:
			selected = true
			
		else:
			selected = false
		
	if event.is_action_pressed("2"):
		if Bselected == false:
			Bselected = true
		
		else:
			Bselected = false
	
	if event.is_action_pressed("3"):
		if CCselecte == false:
			CCselecte = true
		else:
			CCselecte = false
	
	if event.is_action_pressed("4"):
		if Cselected == false:
			Cselected = true
		else:
			Cselected = false
	
	


	

	
		
	#Hoe
	if selected and Input.is_action_just_pressed("left_click"):
		if SingletoneAndOthers.hoe2_bought == false:
			var mouse_pos = tile_map.get_local_mouse_position()
			var tile_pos = tile_map.local_to_map(mouse_pos) 
			var current_tile_id = tile_map.get_cell_source_id(0, tile_pos)
			if current_tile_id == 0:
		
				tile_map.set_cell(0, tile_pos, new_tile_id, Vector2(0, 0))
				tile_map.set_cell(1, tile_pos, new_tile_id, Vector2(0, 0))
		
		else:
			var mouse_pos = tile_map.get_local_mouse_position()
			var tile_pos = tile_map.local_to_map(mouse_pos)
			var positions = [
				tile_pos,
				tile_pos + Vector2i.LEFT + Vector2i(0, -1),
				tile_pos + Vector2i.LEFT + Vector2i(0, 1),
				tile_pos + Vector2i.LEFT,
				tile_pos + Vector2i.RIGHT + Vector2i(0, -1),
				tile_pos + Vector2i.RIGHT + Vector2i(0, 1),
				
				tile_pos + Vector2i.RIGHT,
				tile_pos + Vector2i.UP,
				tile_pos + Vector2i.DOWN,
			]
			
			## make by chat gpt
			for pos in positions:
				var current_tile_id = tile_map.get_cell_source_id(0, pos)  
				var tile_data = tile_map.get_cell_tile_data(0, pos)  

				
				if tile_data and tile_data.get_custom_data("Farm"):
					continue  

				
				if current_tile_id == 0:
					tile_map.set_cell(0, pos, new_tile_id, Vector2i(0, 0))
					tile_map.set_cell(1, pos, new_tile_id, Vector2i(0, 0))
			
		
		#Bucket
	if Bselected and Input.is_action_just_pressed("left_click") and SingletoneAndOthers.Bucket_liters > 0:
		
		var mouse_pos = tile_map.get_local_mouse_position()
		var tile_pos = tile_map.local_to_map(mouse_pos) 
		var current_tile_id = tile_map.get_cell_source_id(0, tile_pos)
		var _current_layer_id = tile_map.get_cell_source_id(1, tile_pos)
		if current_tile_id == 1: # problema, se pune apa incontinu
			
			if SingletoneAndOthers.Bucket_liters > 0 and current_tile_id == 1:
				SingletoneAndOthers.Bucket_liters -= 1
			
				
				tile_map.set_cell(0, tile_pos, water_tile_id, Vector2(0, 0))
				tile_map.set_cell(1, tile_pos, water_tile_id, Vector2(0, 0))
				
			
			#CarrotS
			
	if Cselected and Input.is_action_just_pressed("left_click"):
		
		var mouse_pos = tile_map.get_local_mouse_position()
		var tile_pos = tile_map.local_to_map(mouse_pos) 
		var _current_layer_id = tile_map.get_cell_source_id(0, tile_pos)
		var current_tile_id = tile_map.get_cell_source_id(1, tile_pos)
		
		if current_tile_id == 2:
			
			if SingletoneAndOthers.Cseeds > 0:
				SingletoneAndOthers.Cseeds -= 1
				
				tile_map.set_cell(0, tile_pos, carrots_tile_id, Vector2(0, 0))
				tile_map.set_cell(1, tile_pos, carrots_tile_id, Vector2(0, 0))
				tile_map.set_cell(3, tile_pos, carrots_tile_id, Vector2(0, 0))
				
				
			#Carrot
		
	if CCselecte and Input.is_action_just_pressed("left_click"):
		
		var mouse_pos = tile_map.get_local_mouse_position()
		var tile_pos = tile_map.local_to_map(mouse_pos) 
		var _current_tile_id = tile_map.get_cell_source_id(0, tile_pos)
		var current_layer_id = tile_map.get_cell_source_id(1, tile_pos)
		if current_layer_id == 4:
			tile_map.set_cell(3, tile_pos, -1)
			tile_map.set_cell(2, tile_pos, -1)
			tile_map.set_cell(1, tile_pos, -1)
			tile_map.set_cell(0, tile_pos, -1)
			tile_map.set_cell(0, tile_pos, 0, Vector2(0, 0))
			SingletoneAndOthers.Carrot += 1
	if Input.is_action_pressed("test_tile"):
		var mouse_pos = tile_map.get_local_mouse_position()
		var tile_pos = tile_map.local_to_map(mouse_pos) 
		var current_tile_id = tile_map.get_cell_source_id(0, tile_pos)
		var current_layer_id = tile_map.get_cell_source_id(1, tile_pos)
		print("Current_layer inainte de: " + str(current_layer_id))
		print("Current_tile inainte de: " + str(current_tile_id))

		


func inst_transition() -> void:
	var instance = Transition_Screen.instantiate()
	target_node.add_child(instance)
	
func inst_secret2() -> void:
	var instance = secret2.instantiate()
	target_node.add_child(instance)




func _on_area_2d_body_entered(_body: Node2D) -> void:
	SingletoneAndOthers.save_game("user://tilemap_data.tres")
	get_tree().paused = true
	inst_transition()
	


func _on_text_final_body_entered(_body: Node2D) -> void:
	inst_secret2()
	SingletoneAndOthers.menu = true
	get_tree().paused = true
	SingletoneAndOthers.is_dialog = true
