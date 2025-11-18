extends Sprite2D

@onready var sound = $AudioStreamPlayer2D


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		sound.play()
		await sound.finished
		get_tree().change_scene_to_file("res://scense/street.tscn")
		#to do !fix this shit or you will get fired!!!
	pass # Replace with function body.
