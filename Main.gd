extends Node2D

var money : int = 0
var rent_amount : int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$RentTimer.start()
	$UICanvas/MainInterface/WorkButton.connect("pressed", self, "_on_work_button_pressed")

func _on_pay_rent():
	if money < rent_amount:
		print("Lost!")
	money -= rent_amount
	rent_amount *= 1.05

func _on_work_button_pressed():
	money += 5
