extends CanvasModulate

var day = Color("ffffff")
var evening = Color("959df1")
var night_color = Color("3a50b1")
var midnight_color = Color("#091d3a")
var clock_node: Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clock_node = get_node("/root/Clock")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if clock_node.hour > 7 and clock_node.hour < 19:
		self.color = day
	elif clock_node.hour > 18 and clock_node.hour < 21:
		self.color = evening
	elif clock_node.hour > 20 and clock_node.hour < 23:
		self.color = night_color
	elif clock_node.hour > 22 and clock_node.hour > 7:
		self.color = midnight_color
	
