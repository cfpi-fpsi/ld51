extends Label

func _read():
	pass

func _on_StampTask_stamp_count_update(total, count):
	self.text = "%d" % (total - count)