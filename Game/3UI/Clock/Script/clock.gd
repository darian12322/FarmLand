extends CanvasLayer



@onready var hours: Label = $Hours
@onready var minutes: Label = $Minutes
@onready var timer: Timer = $Timer

var EndScreen = preload("res://Game/3UI/EndScreen/end_screen.tscn")
var minute: int = 0
var hour: int = 7
var target_node: Node = null




# Called when the node enters the scene tree for the first time.
func _ready() -> void:



	target_node = get_node("/root")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	
	if minute == 0:
		minutes.text = "00"
	else:
		label_minute()
	if minute == 60:
		minute = 0
		hour += 1
	if hour == 24:
		hour = 0
	if hour == 1:
		inst()
		
	label_hours()
	
	
	
		
	
	
func _on_timer_timeout() -> void:
	minute += 15
	

func label_minute() -> void:
	minutes.text = str(minute)
	

func label_hours() -> void:
	if hour < 10:
		hours.text = "0" + str(hour) + " :"
	else:
		hours.text = str(hour) + " :"
	


func inst() -> void:
	var instance = EndScreen.instantiate()
	target_node.add_child(instance)


func set_always() -> void:
	Clock.process_mode = Node.PROCESS_MODE_ALWAYS
