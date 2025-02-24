extends TextureRect


var Hoe_scene = preload("res://Game/3UI/Inventory/tools/texture_rect.tscn")
var Bucket_scene = preload("res://Game/3UI/Inventory/tools/bucket.tscn")
var CarrotSeeds_scene = preload("res://Game/3UI/Inventory/tools/carrot_seed.tscn")
var Hoe2_scene = preload("res://Game/3UI/Inventory/tools/hoe_2.tscn")


var Tile_mapNode: Node = null
var Hoe_instance = null
var Bucket_instance = null
var CarrotS_instance = null
var Hoe2_instance = null
var Hoe_spawned: bool = false
var Bucket_spawned: bool = false
var CarrotS_spawned: bool = false
var One_selected: int = 0
var Bypass: int  = 0
var BBypass: int = 0
var CSBypass: int = 0
var CCBypass: int = 0
var Bypassv2: bool = false
var BBypassv2: bool = false
var CSBypassv2: bool = false
var CCBypassv2: bool = false
var hoe: bool = false
var bucket: bool = false
var carrotS: bool = false





var s2: int = 0
var s3: int = 0
var s4: int = 0
var s5: int = 0
var s6: int = 0




@onready var qantity: Label = $Qantity
@onready var qantity_2: Label = $Qantity2
@onready var coins_number: Label = $"../CoinsNumber"

@onready var slot_1: TextureRect = $Slot1
@onready var slot_2: TextureRect = $Slot2
@onready var slot_3: TextureRect = $Slot3
@onready var slot_4: TextureRect = $Slot4
@onready var slot_5: TextureRect = $Slot5

@onready var hoe_2: TextureRect = $Hoe2




func _ready() -> void:
	Tile_mapNode = get_node_or_null("/root/Game/GameInterface/Farm(Main)")
	

func _physics_process(_delta: float) -> void:
	if SingletoneAndOthers.hoe2_bought:
			hoe_2.show()
	if get_tree().current_scene.scene_file_path=="res://game.tscn" or get_tree().current_scene.scene_file_path=="res://house_1_interface.tscn" or get_tree().current_scene.scene_file_path=="res://shop_map.tscn" or get_tree().current_scene.scene_file_path=="res://shop_interior.tscn" or get_tree().current_scene.scene_file_path == "res://shop_carpenter_interior.tscn":
		update_label_carrotS()
		update_label_carrot()
		update_label_coins()
	if get_tree().current_scene.scene_file_path=="res://game.tscn":
		
		
	#----------------------------------------------------select-----------------------------------------------------------
		if One_selected != 2:
			s2 = 0
		if One_selected != 3:
			s3 = 0
		if One_selected != 4:
			s4 = 0
		if One_selected != 5:
			s5 = 0
		
	#-----------------------hoe------
		if hoe and One_selected != 1:
			remove_hoe()
			Bypass = 0
			Bypassv2 = false
		if Input.is_action_just_pressed("1"):
			
			Tile_mapNode.Bselected = false
			Tile_mapNode.Cselected = false
			Tile_mapNode.CCselecte = false
			
			if Bypass == 0:
				show_selected(1, slot_1)
				Bypass = 1
				spawn_Hoe()
				Bypassv2 = true
			elif One_selected == 1 or Bypassv2 == true:
				hide_selected(One_selected)
				Bypass = 0
				remove_hoe()
				Bypassv2 = false
			
		if Hoe_instance and Bypass == 1 and Bypassv2 and One_selected == 1:
				Hoe_instance.global_position = get_global_mouse_position()
		if Hoe2_instance and Bypass == 1 and Bypassv2 and One_selected == 1:
				Hoe2_instance.global_position = get_global_mouse_position()
				
				
		if Bucket_instance and BBypass == 1 and BBypassv2 and One_selected == 2:
				Bucket_instance.global_position = get_global_mouse_position()
		
		if CarrotS_instance and CSBypass == 1 and CSBypassv2 and One_selected == 4:
			CarrotS_instance.global_position = get_global_mouse_position()
			
		
		
		
	#--------------------------bucket-----
		if bucket and One_selected != 2:
			remove_bucket()
			BBypass = 0
			BBypassv2 = false
			
		if Input.is_action_just_pressed("2"):
			Tile_mapNode.Cselected = false
			Tile_mapNode.selected = false
			Tile_mapNode.CCselecte = false
			if BBypass == 0:
				show_selected(2, slot_2)
				BBypass = 1
				spawn_Bucket()
				BBypassv2 = true
			elif One_selected == 2 or Bypassv2 == true:
				hide_selected(One_selected)
				BBypass = 0
				remove_bucket()
				BBypassv2 = false
		
		
		#-----------------PickupCarrots-----
		if One_selected != 3:
			CCBypass = 0
			CCBypassv2 = false
		
		if Input.is_action_just_pressed("3"):
			Tile_mapNode.Cselected = false
			Tile_mapNode.Bselected = false
			if CCBypass == 0:
				show_selected(3, slot_3)
				CCBypass = 1
				CCBypassv2 = true
			elif One_selected == 3 or CCBypassv2 == true:
				hide_selected(One_selected)
				CCBypass = 0
				CCBypassv2 = false
				
				
		
	#-----------------carrotS----------------------

		if carrotS and One_selected != 4:
			remove_carrotS()
			CSBypass = 0
			CSBypassv2 = false



		if Input.is_action_just_pressed("4"):
			Tile_mapNode.Bselected = false
			Tile_mapNode.selected = false
			Tile_mapNode.CCselecte = false
			if CSBypass == 0:
				show_selected(4, slot_4)
				CSBypass = 1
				spawn_carrotS()
				CSBypassv2 = true
			elif One_selected == 4 or Bypassv2 == true:
				hide_selected(One_selected)
				CSBypass = 0
				remove_carrotS()
				CSBypassv2 = false
				
				
				
				
				
				
				
				
				
				
			
		if Input.is_action_just_pressed("5"):
			Tile_mapNode.Cselected = false
			Tile_mapNode.Bselected = false
			Tile_mapNode.CCselecte = false
			if s5 == 0:
				Tile_mapNode.selected = false
				show_selected(5, slot_5)
				s5 = 1
			else:
				hide_selected(One_selected)
				s5 = 0
				
	

func show_selected(slot_number: int, slot: TextureRect) -> void:
	if One_selected != 0: 
		hide_selected(One_selected)
		
	One_selected = slot_number
	slot.show()


	

	

func hide_selected(slot_number: int):
	match slot_number:
		1:
			slot_1.hide()
		2:
			slot_2.hide()
		3:
			slot_3.hide()
		4:
			slot_4.hide()
		5:
			slot_5.hide()
		_:
			pass
	
	
	

	
	
	
	
	
	
	
	
	
	
	
		
#----------------------------------------------------------------------------------------------------------
	
func update_label_carrotS() -> void:
	qantity.text = str(SingletoneAndOthers.Cseeds)

func update_label_carrot() -> void:
	qantity_2.text = str(SingletoneAndOthers.Carrot)

func update_label_coins() -> void:
	coins_number.text = str(SingletoneAndOthers.coin)


func spawn_Hoe() -> void:
	hoe = true
	if SingletoneAndOthers.hoe2_bought:
		Hoe2_instance = Hoe2_scene.instantiate()
		add_child(Hoe2_instance)
		Hoe2_instance.global_position = get_global_mouse_position()
	else:
		Hoe_instance = Hoe_scene.instantiate()
		add_child(Hoe_instance)
		Hoe_instance.global_position = get_global_mouse_position()

func remove_hoe() -> void:
	if SingletoneAndOthers.hoe2_bought:
		Hoe2_instance.queue_free()
	else:
		Hoe_instance.queue_free()
	hoe = false

func spawn_Bucket() -> void:
	bucket = true
	Bucket_instance = Bucket_scene.instantiate()
	add_child(Bucket_instance)
	Bucket_instance.global_position = get_global_mouse_position()
	
func remove_bucket() -> void:
	Bucket_instance.queue_free()
	bucket = false
	
func spawn_carrotS() -> void:
	carrotS = true
	CarrotS_instance = CarrotSeeds_scene.instantiate()
	add_child(CarrotS_instance)
	CarrotS_instance.global_position = get_global_mouse_position()
	
func remove_carrotS() -> void:
	CarrotS_instance.queue_free()
	carrotS = false
	
	
