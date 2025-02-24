extends CanvasLayer

@onready var rich_text_label: RichTextLabel = $TextureRect/MarginContainer/RichTextLabel

var dialog: int = 0
var current_length: int = 0
var text_length: int = 0
var price = 0
var second_dialog: bool = false

# def price is 30 g


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SingletoneAndOthers.is_dialog = true
	rich_text_label.set_visible_characters(0)
	
	





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SingletoneAndOthers.dialog_seller == 0:
		if dialog == 0:
			rich_text_label.text = "I have been expecting you, dear mortal. Welcome to my little shop, open at all times! Or at least, for as long as you can stay awake… Ha ha."
			text_length = rich_text_label.text.length()
		elif dialog == 1:
			rich_text_label.text = "You may sell me the fruits of your mundane labor—resources gathered with your own hands. Their price(only the selling) shifts like the tides, changing from one day to the next.Or perhaps… you’d rather buy the seeds of hope—for a chance to survive. Ha ha ha!"
			text_length = rich_text_label.text.length()
		elif dialog == 2:
			rich_text_label.text = "For now, this is all you can do, for the creator of this world has lost the will to forge more… Cursed be they!"
			text_length = rich_text_label.text.length()
		else:
			SingletoneAndOthers.is_dialog = false
			SingletoneAndOthers.dialog_seller += 1
			queue_free()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if current_length < rich_text_label.text.length():
			rich_text_label.set_visible_characters(text_length)
			current_length = text_length
		else:
			dialog += 1
			rich_text_label.set_visible_characters(0)
			current_length = 0
			if second_dialog:
				second_dialog = false
				queue_free()
		
		
		


func _on_timer_timeout() -> void:

	if current_length < text_length:
		current_length += 1
		rich_text_label.set_visible_characters(current_length)
