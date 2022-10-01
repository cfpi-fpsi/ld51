extends Node2D

var money : int = 0
var rent_amount : int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$RentTimer.start()
	pass # Replace with function body.

func _on_pay_rent():
	if money < rent_amount:
		print("Lost!")
	money -= rent_amount
