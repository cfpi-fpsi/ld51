extends Area2D

signal stamping(doc, pos)
signal stamped(doc)

var doc_type
var stamped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if stamped:
			return
		emit_signal("stamping", self, to_local(event.position))

func stamp_document(pos, stamp_image, stamp_type):
	pos -= stamp_image.get_size() / 2
	var new_image_texture = ImageTexture.new()
	var new_image = Image.new()
	var base_image = $page.texture.get_data()
	base_image.convert(Image.FORMAT_RGBA8)
	new_image.create(base_image.get_size().x, base_image.get_size().y, false, Image.FORMAT_RGBA8)
	new_image.blit_rect(base_image, Rect2(Vector2.ZERO, base_image.get_size()), Vector2.ZERO)
	new_image.blend_rect(stamp_image, Rect2(Vector2.ZERO, stamp_image.get_size()), pos)
	new_image_texture.create_from_image(new_image)
	$page.texture = new_image_texture
	stamped = true
	emit_signal("stamped", self)
