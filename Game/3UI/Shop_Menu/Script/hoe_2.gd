extends RigidBody2D

@onready var timer: Timer = $Timer
var price: int = 400
@onready var hoe_2: Button = $"../Hoe2"
var bought: bool = false
@onready var buying: AudioStreamPlayer2D = $buying



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if can_affor() == false or bought or SingletoneAndOthers.hoe2_bought:
		hoe_2.disabled = true
	else:
		hoe_2.disabled = false

	


func _on_timer_timeout() -> void:
	hide()


func _on_hoe_2_pressed() -> void:
	if can_affor():
		SingletoneAndOthers.hoe2_bought = true
		SingletoneAndOthers.coin -= price
		bought = true
		timer.start()
		gravity_scale = 1
		apply_impulse(Vector2(-200, -500))


func can_affor():
	buying.play()
	if SingletoneAndOthers.coin >= price:
		return true
	return false
