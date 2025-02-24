extends RigidBody2D
@onready var timer: Timer = $Timer
@onready var bucket_2: Button = $"../Bucket2"
@onready var buying: AudioStreamPlayer2D = $buying




var price: int = 200
var bought: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if can_affor() == false or bought or SingletoneAndOthers.bucket2_bought:
		bucket_2.disabled = true
	else:
		bucket_2.disabled = false

func _on_timer_timeout() -> void:
	hide()
	


func _on_bucket_2_pressed() -> void:
	if can_affor():
		buying.play()
		SingletoneAndOthers.bucket2_bought = true
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
