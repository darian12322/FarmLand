extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var buy: Button = $Buy
@onready var carrot_sells: Label = $CarrotSells
@onready var sell: Button = $Sell
@onready var button_2: Button = $Button2
@onready var cash_register_purchase_87313: AudioStreamPlayer = $"Cash-register-purchase-87313"

var priceSeeds: int = 20
var priceC


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SingletoneAndOthers.is_dialog = true
	priceC = SingletoneAndOthers.priceS
	update_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	if SingletoneAndOthers.coin < priceSeeds:
		buy.disabled = true
	else:
		buy.disabled = false
		
	
	if SingletoneAndOthers.Carrot <= 0:
		sell.disabled = true
		button_2.disabled = true
	else:
		button_2.disabled = false
		sell.disabled = false
	
	
	
func _on_button_pressed() -> void:
	animation_player.play("back")
	
	
func queue_freee() -> void:
	SingletoneAndOthers.is_dialog = false
	
	


func _on_buy_pressed() -> void:
	if can_afford():
		SingletoneAndOthers.coin -= priceSeeds
		SingletoneAndOthers.Cseeds += 1


func _on_button_2_pressed() -> void:
	if can_sell():
		SingletoneAndOthers.coin += priceC * SingletoneAndOthers.Carrot
		SingletoneAndOthers.Carrot -= SingletoneAndOthers.Carrot
		




func _on_sell_pressed() -> void:
	if can_sell():
		SingletoneAndOthers.Carrot -= 1
		SingletoneAndOthers.coin += priceC






func can_afford():
	cash_register_purchase_87313.play()
	if SingletoneAndOthers.coin >= priceSeeds:
		return true
	return false
	
func can_sell():
	cash_register_purchase_87313.play()
	if SingletoneAndOthers.Carrot > 0:
		return true
	return false
	


		
	
func update_label() -> void:
	carrot_sells.text = str(priceC)

func turn_on_bypass() -> void:
	SingletoneAndOthers.bypass_for_dialog = false
