extends CanvasLayer

var coinscollected = 0



func _ready():
	$coincount.text ="Coins: " + str(coinscollected)

func _process(delta):
	pass


func _on_Coin_body_entered(body):
	coinscollected = coinscollected + 10
	$AudioStreamPlayer.play()
	$coincount.text ="Coins: " + str(coinscollected)
