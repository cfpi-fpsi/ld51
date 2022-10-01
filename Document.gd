extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		print("Clicked on the document")
		stamp_document(to_local(event.global_position))

func stamp_document(pos):
	var new_image_texture = ImageTexture.new()
	var new_image = Image.new()
	var base_image = $page.texture.get_data()
	base_image.convert(Image.FORMAT_RGBA8)
	var stamp_image = load("res://work/stamp_ok.png").get_data()
	pos -= stamp_image.get_size() / 2
	new_image.create(base_image.get_size().x, base_image.get_size().y, false, Image.FORMAT_RGBA8)
	new_image.blit_rect(base_image, Rect2(Vector2.ZERO, base_image.get_size()), Vector2.ZERO)
	new_image.blend_rect(stamp_image, Rect2(Vector2.ZERO, stamp_image.get_size()), pos)
	new_image_texture.create_from_image(new_image)
	$page.texture = new_image_texture
