extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var bucket_4: RigidBody2D = $Bucket4
@onready var bucket_5: RigidBody2D = $Bucket5
@onready var house_2: RigidBody2D = $House2




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SingletoneAndOthers.is_dialog = true
	if SingletoneAndOthers.hoe2_bought:
		rigid_body_2d.hide()
	if SingletoneAndOthers.bucket2_bought:
		bucket_4.hide()
	if SingletoneAndOthers.bucket3_bought:
		bucket_5.hide()
	if SingletoneAndOthers.house2_bought:
		house_2.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
		
 


func _on_x_pressed() -> void:
	animation_player.play("back")

func is_dialog() -> void:
	SingletoneAndOthers.is_dialog = false
	SingletoneAndOthers.bypass_for_dialog2 = false

func invs() -> void:
	if SingletoneAndOthers.hoe2_bought:
		rigid_body_2d.hide()
	if SingletoneAndOthers.bucket2_bought:
		bucket_4.hide()
	if SingletoneAndOthers.bucket3_bought:
		bucket_5.hide()
	if SingletoneAndOthers.house2_bought:
		house_2.hide()
