extends Node


var Cseeds: int = 10
var Carrot: int = 0
var Bucket_liters = 0
var In_house: bool = false
var near_bed: bool = false
var shop_home: bool = false
var Out_schop: bool = false
var Out_Carpenter: bool = false
var pause_Menu = preload("res://Game/3UI/PauseMenu/pause_menu.tscn")
var pause_menu_node: Node = null
var pause_menu_Animation: AnimatedSprite2D = null
var pause_open: bool = false
var open_bypass: bool = false
var target_node: Node = null
var Days: int = 1
var time_passed: bool = false
var is_dialog: bool = false



var dialog_seller: int = 0
var dialog_buyer: int = 0
var dialog_oldm: int = 0
var rng = RandomNumberGenerator.new()
var rngN: int = 1
var priceS: int = 30
var TimePassedForRNG: bool = false

var bypass_for_dialog: bool = false
var bypass_for_dialog2: bool = false
var coin: int = 99999999999


var hoe2_bought: bool = false
var bucket2_bought: bool = false
var bucket3_bought: bool = false
var bucket3Bypass_bought: bool = false
var house2_bought: bool = false


var settings_In: bool = false
var settings_Out: bool = false

var start_In: bool = false
var ending: bool = false

var menu: bool = false
var start_path: bool = false
var pathover: bool = false
func _ready() -> void:
	
	#delete_save("user://tilemap_data.tres")
	load_game("user://tilemap_data.tres")
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	target_node = get_node("/root")
	
	



	
	
func _physics_process(_delta: float) -> void:

	
	if time_passed and dialog_oldm == 1:
		dialog_oldm = 2
	elif time_passed and dialog_oldm == 3:
		dialog_oldm = 4
	

	
	#----------------price for carrots(sells)-----------
	if TimePassedForRNG or time_passed:
		
		rng.randomize()
		rngN = rng.randi_range(0, 5)
		
		
		
	match rngN:
		0:
			priceS = 14
		1:
			priceS = 22
		2:
			priceS = 26
		3:
			priceS = 30
		4:
			priceS = 33
		5:
			priceS = 36
			
	#---------------------------------------------
	if pause_menu_node == null:
		pause_menu_node = get_node_or_null("root/Pause_Menu")
	
	pause_menu_Animation = get_node_or_null("/root/Pause_Menu/CanvasLayer/AnimatedSprite2D")
	
		
	
	
	

		
	
## Fullscreen
func _input(event) -> void:
	if event.is_action_pressed("Fullscreen"):
		var screen = DisplayServer.window_get_mode()
		if screen == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED) 
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)  
	
	## Pause menu
	if event.is_action_pressed("Pause"):
		
		if get_tree().current_scene.scene_file_path=="res://game.tscn" or get_tree().current_scene.scene_file_path=="res://house_1_interface.tscn" or get_tree().current_scene.scene_file_path=="res://shop_map.tscn" or get_tree().current_scene.scene_file_path=="res://shop_interior.tscn" or get_tree().current_scene.scene_file_path == "res://shop_carpenter_interior.tscn":
			if menu == false:
				if pause_open == false and open_bypass == false:
					inst()
					get_tree().paused = true
					pause_open = true
					open_bypass = true
				else:
					get_tree().paused = false
					pause_open = false


	
func save_game(file_path: String) -> void:
	
	var tilemap = get_node("/root/Game/GameInterface/Farm(Main)/TileMap")
	
	
	if tilemap:
		var tilemap_data = TileMapData.new()
		
		# Iterează prin toate layerele TileMap-ului
		for layer in range(tilemap.get_layers_count()):
			for cell in tilemap.get_used_cells(layer):  # Specifică layer-ul curent
				var tile_data = {
					"layer": layer,  # Adaugă layer-ul în date
					"cell": [cell.x, cell.y],
					"tile": tilemap.get_cell_source_id(layer, cell),
					"atlas_coords": tilemap.get_cell_atlas_coords(layer, cell)
				}
				
				# Obține TileData pentru flip și transpunere
				var tile_data_obj = tilemap.get_cell_tile_data(layer, cell)
				if tile_data_obj:
					tile_data["flip_h"] = tile_data_obj.flip_h
					tile_data["flip_v"] = tile_data_obj.flip_v
					tile_data["transpose"] = tile_data_obj.transpose
				else:
					tile_data["flip_h"] = false
					tile_data["flip_v"] = false
					tile_data["transpose"] = false
				
				tilemap_data.cells.append(tile_data)
		
		# Salvează resursa într-un fișier
		var error = ResourceSaver.save(tilemap_data, file_path)
		if error == OK:
			print("TileMap saved successfully!")
		else:
			print("Failed to save TileMap: ", error)
	else:
		print("TileMap not found at the specified path!")

# Încarcă TileMap-ul dintr-un fișier
func load_game(file_path: String) -> void:
	var tilemap = get_node("/root/Game/GameInterface/Farm(Main)/TileMap")
	if tilemap:
		var tilemap_data = ResourceLoader.load(file_path)
		if tilemap_data:
			tilemap.clear()
			
			for tile_data in tilemap_data.cells:
				var layer = tile_data["layer"]  # Obține layer-ul
				var cell = Vector2i(tile_data["cell"][0], tile_data["cell"][1])
				
				# Setează celula în TileMap
				tilemap.set_cell(
					layer,  # Specifică layer-ul
					cell,
					tile_data["tile"],
					tile_data["atlas_coords"]
				)
				
				# Aplică flip și transpunere (dacă există)
				if tile_data.get("flip_h", false):
					tilemap.set_cell_flip_h(layer, cell, true)
				if tile_data.get("flip_v", false):
					tilemap.set_cell_flip_v(layer, cell, true)
				if tile_data.get("transpose", false):
					tilemap.set_cell_transpose(layer, cell, true)
			
			print("TileMap loaded successfully!")
		else:
			print("Failed to load TileMap data from file: ", file_path)
	else:
		print("TileMap not found at the specified path!")


#----------------------------------------------------------------------------------------------------------------


func inst():
	var instance = pause_Menu.instantiate()
	target_node.add_child(instance)
	
func delete_save(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		var error = DirAccess.remove_absolute(file_path)
		if error == OK:
			print("Salvarea a fost ștearsă cu succes!")
		else:
			print("Eroare la ștergerea fișierului de salvare: ", error)
	else:
		print("Fișierul de salvare nu există.")
