extends Node

var title_scene = preload("res://title_screen.tscn")
var act_one = preload("res://hud.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().change_scene_to_packed(title_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMIDI:
		_print_midi_info(event)
		match event.message:
			MIDI_MESSAGE_PROGRAM_CHANGE:
				pass
		
func _change_scene(pc):
	pass
	
func _print_midi_info(midi_event: InputEventMIDI):
	print(midi_event)
	print("Channel " + str(midi_event.channel))
	print("Message " + str(midi_event.message))
	print("Pitch " + str(midi_event.pitch))
	print("Velocity " + str(midi_event.velocity))
	print("Instrument " + str(midi_event.instrument))
	print("Pressure " + str(midi_event.pressure))
	print("Controller number: " + str(midi_event.controller_number))
	print("Controller value: " + str(midi_event.controller_value))
