extends Node2D

var document_scene = preload("res://Document.tscn")
var current_stamp = null

func _ready():
	for i in 1:
		var doc = document_scene.instance()
		doc.position = Vector2(100 + randi() % 50, randi() % 50)
		$UnstampedPile.add_child(doc)
	pass # Replace with function body.

