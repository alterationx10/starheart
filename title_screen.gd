extends CanvasLayer

var rng = RandomNumberGenerator.new()
var devices: PackedStringArray
# Called when the node enters the scene tree for the first time.
func _ready():
	_check_devices()
	_generate_twinkle_stars()



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
		$Space.add_child(ts)
	pass

func _check_devices():
	OS.open_midi_inputs()
	devices = OS.get_connected_midi_inputs()
	var device_count = devices.size()

	if device_count == 0:
		$MIDIDevicesLabel.text = "No MIDI devices found!"
		$MIDIScanButton.show()
	elif devices.bsearch("M8") >= 0:
		$MIDIDevicesLabel.text = "M8 detected!"
		$MIDIScanButton.hide()
	else:
		$MIDIDevicesLabel.text = "Non-M8 MIDI detected!"
		$MIDIScanButton.hide()
		


func _on_midi_scan_button_pressed():
	_check_devices()
