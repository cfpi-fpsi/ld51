extends Node2D

var document_scene = preload("res://Document.tscn")
var current_stamp = null
var stamps = {}
var stamp_ok_image = preload("res://work/stamp_ok.png").get_data()
var stamp_nok_image = preload("res://work/stamp_nok.png").get_data()
var stamps_count = 0
var max_documents = 10

signal stamp_count_update(count)
signal task_completed

func _ready():
	stamps['ok'] = stamp_ok_image
	stamps['nok'] = stamp_nok_image
	add_new_document()
	emit_signal("stamp_count_update", max_documents, stamps_count)

func add_new_document():
		var doc = document_scene.instance()
		if randi() % 2 == 0:
			doc.doc_type = stamps['ok']
		else:
			doc.doc_type = stamps['nok']
		doc.connect("stamping", self, "_on_document_stamp")
		doc.connect("stamped", self, "_on_stamped_document")
		doc.position = Vector2(100 + randi() % 15, -stamps_count + (randi() % 5 - 2))
		$UnstampedPile.add_child(doc)

func _on_document_stamp(doc, pos):
	if current_stamp != null:
		doc.stamp_document(pos, stamps[current_stamp], current_stamp)

func _on_stamped_document(doc):
	$UnstampedPile.remove_child(doc)
	$StampedPile.add_child(doc)
	add_new_document()
	stamps_count += 1
	emit_signal("stamp_count_update", max_documents, stamps_count)
	if stamps_count >= max_documents:
		emit_signal("task_completed")

func _on_change_ok_stamp():
	current_stamp = 'ok'

func _on_change_nok_stamp():
	current_stamp = 'nok'
