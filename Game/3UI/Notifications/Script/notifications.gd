extends Control



@onready var rich_text_label: RichTextLabel = $CanvasLayer/RichTextLabel
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	


func _on_timer_timeout() -> void:
	queue_free()
	
	
