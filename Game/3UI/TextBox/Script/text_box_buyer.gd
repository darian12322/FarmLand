extends CanvasLayer

@onready var rich_text_label: RichTextLabel = $TextureRect/MarginContainer/RichTextLabel

var dialog: int = 0
var current_length: int = 0
var text_length: int = 0
var price = 0
var second_dialog: bool = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SingletoneAndOthers.is_dialog = true
	rich_text_label.set_visible_characters(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if SingletoneAndOthers.dialog_buyer == 0:
		if dialog == 0:
			rich_text_label.text = "Hello, darling! 🌟 Welcome to my wonderful little shop, where you can buy a better bucket or even a whole house! Isn't that just amazing?"
			text_length = rich_text_label.text.length()
		elif dialog == 1:
			rich_text_label.text = "Oh, and I hope that old man from the house next door didn’t scare you! He’s a bit strange, but what can I do? He’s my husband! 😆"
			text_length = rich_text_label.text.length()
		else:
			SingletoneAndOthers.is_dialog = false
			SingletoneAndOthers.dialog_buyer += 1
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
