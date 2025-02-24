extends RigidBody2D

@onready var timer: Timer = $Timer
@onready var bucket_3: Button = $"../Bucket3"
var price = 1200
var bought: bool = false
@onready var buying: AudioStreamPlayer2D = $buying



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if can_affor() == false or bought or SingletoneAndOthers.bucket3_bought:
		bucket_3.disabled = true
	else:
		bucket_3.disabled = false


func _on_bucket_3_pressed() -> void:
	if can_affor():
		SingletoneAndOthers.bucket3_bought = true
		SingletoneAndOthers.bucket3Bypass_bought = true
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
