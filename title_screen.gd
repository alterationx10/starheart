extends CanvasLayer

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_generate_twinkle_stars()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _generate_twinkle_stars():
	# We are set to 640/360
	# TwinkleStars are 16x16
	# Add 20 stars across, at various 
	for s in range(8, 640-8, 32):
		var ts = load("res://twinkle_star.tscn").instantiate()
		ts.position = Vector2(s, rng.randf_range(8, 360-8)) 
		add_child(ts)
	pass
