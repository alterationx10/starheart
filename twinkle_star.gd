extends Node2D


var ts: AnimatedSprite2D
var tt: Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	var timeout = rng.randf_range(2, 5)
	ts = $TwinkleStar
	var n_frames = ts.sprite_frames.get_frame_count("default")
	ts.sprite_frames.set_animation_loop("default", false)
	ts.sprite_frames.set_animation_speed("default", float(n_frames));

	tt = $TwinkleTimer
	tt.wait_time = timeout
	tt.start()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_twinkle_timer_timeout():
	ts.play()


