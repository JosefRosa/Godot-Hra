extends Node2D


var CoinPoints = 10

func _on_Coin_body_entered(body):
	if body is Player:
		queue_free()
	else:
		$Coin.play("coin")
		
