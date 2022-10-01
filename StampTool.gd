extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(String, "Red", "Green") var stamp_type
var mouse_pos
var spr

# Called when the node enters the scene tree for the first time.
func _ready():
	spr = $Sprite
	switch_type(stamp_type)
	self.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = get_viewport().get_mouse_position()
	position = mouse_pos

func switch_type(type):
	stamp_type = type
	if(stamp_type == "Red"):
		spr.texture = load("res://work/stamp_machine_red.png")
	elif(stamp_type == "Green"):
		spr.texture = load("res://work/stamp_machine_green.png")
	else:
		push_error ( "Wrong Type %s in StampTool:switch_type" % type )
	spr.position.x = 0
	spr.position.y = -10
