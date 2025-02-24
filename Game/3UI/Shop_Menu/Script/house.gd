extends RigidBody2D

@onready var timer: Timer = $Timer
var price = 1500
@onready var house: Button = $"../House"
var bought: bool = false
@onready var buying: AudioStreamPlayer2D = $buying



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if can_affor() == false or bought or SingletoneAndOthers.house2_bought:
		house.disabled = true
	else:
		house.disabled = false
	
func _on_house_pressed() -> void:
	if can_affor():
		SingletoneAndOthers.house2_bought= true
		SingletoneAndOthers.coin -= price
		bought = true
		timer.start()
		gravity_scale = 1
		apply_impulse(Vector2(-200, -500))
		
		
		
		
		
func _on_timer_timeout() -> void:
	queue_free()


func can_affor():
	buying.play()
	if SingletoneAndOthers.coin >= price:
		return true
	return false
