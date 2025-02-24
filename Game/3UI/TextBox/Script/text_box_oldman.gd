extends CanvasLayer

var dialog: int = 0
var current_length: int = 0
var text_length: int = 0
@onready var rich_text_label: RichTextLabel = $TextureRect/MarginContainer/RichTextLabel
var second_dialog: bool = false
var price: int = 2
@onready var timer: Timer = $Timer
var finalq = false
@onready var final: Timer = $final


@onready var yes: Button = $Yes
@onready var button: Button = $Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yes.hide()
	button.hide()
	if SingletoneAndOthers.dialog_oldm == 0:
		price = 2
	elif SingletoneAndOthers.dialog_oldm == 2:
		price = 5
	elif SingletoneAndOthers.dialog_oldm == 4:
		price = 30
	SingletoneAndOthers.is_dialog = true
	rich_text_label.set_visible_characters(0)

func _input(event: InputEvent) -> void:
	if dialog == 0 and SingletoneAndOthers.dialog_oldm == 0:
		if event.is_action_pressed("left_click"):
			
			if current_length < rich_text_label.text.length():
				rich_text_label.set_visible_characters(text_length)
				current_length = text_length
				yes.show()
				button.show()
				dialog += 1
			else:
				
				dialog += 1
				rich_text_label.set_visible_characters(0)
				current_length = 0
			
	elif dialog == 0 and SingletoneAndOthers.dialog_oldm == 2:
		if event.is_action_pressed("left_click"):
			
			if current_length < rich_text_label.text.length():
				rich_text_label.set_visible_characters(text_length)
				current_length = text_length
				yes.show()
				button.show()
				dialog += 1
			else:
				
				dialog += 1
				rich_text_label.set_visible_characters(0)
				current_length = 0
		
	elif dialog == 0 and SingletoneAndOthers.dialog_oldm == 4:
		if event.is_action_pressed("left_click"):
			
			if current_length < rich_text_label.text.length():
				rich_text_label.set_visible_characters(text_length)
				current_length = text_length
				yes.show()
				button.show()
				dialog += 1
			else:
				
				dialog += 1
				rich_text_label.set_visible_characters(0)
				current_length = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if finalq:
		
		yes.disabled = true
		button.disabled = true
		dialog = 0
		if dialog == 0:
			
			rich_text_label.text = "Now, follow me"
			text_length = rich_text_label.text.length()
			yes.show()
			button.show()
			SingletoneAndOthers.is_dialog = false
	
	
	
	
	if can_afford() and finalq == false:
		yes.disabled = false
	elif finalq == false:
		yes.disabled = true
	
	if SingletoneAndOthers.dialog_oldm == 0:
		if dialog == 0:
			
			rich_text_label.text = "Well, hello there, young one! Would you be so kind as to spare an old man two carrots?"
			text_length = rich_text_label.text.length()
			yes.show()
			button.show()

		if text_length == current_length:
			dialog = 1
	elif SingletoneAndOthers.dialog_oldm == 2:
		if dialog == 0:
			
			rich_text_label.text = "Hello again! Could you spare me a few more?"
			text_length = rich_text_label.text.length()
			yes.show()
			button.show()
			
		if text_length == current_length:
			dialog = 1
	elif SingletoneAndOthers.dialog_oldm == 4:
		if dialog == 0:
			
			rich_text_label.text = "Hello, this is my last request—could you give me a few more carrots?"
			text_length = rich_text_label.text.length()
			yes.show()
			button.show()
			
		if text_length == current_length:
			dialog = 1
func _on_timer_timeout() -> void:
	if current_length < text_length:
		current_length += 1
		rich_text_label.set_visible_characters(current_length)


func can_afford():
	if SingletoneAndOthers.Carrot >= price:
		return true
	return false


func _on_yes_pressed() -> void:
	if can_afford():
		if SingletoneAndOthers.dialog_oldm == 4:
			SingletoneAndOthers.dialog_oldm += 1
			finalq = true
			final.start()
		else:
			SingletoneAndOthers.dialog_oldm += 1
			SingletoneAndOthers.is_dialog = false
			SingletoneAndOthers.Carrot -= price
			queue_free()


func _on_button_pressed() -> void:
	SingletoneAndOthers.is_dialog = false
	queue_free()


func _on_final_timeout() -> void:
	SingletoneAndOthers.start_path = true
	queue_free()
