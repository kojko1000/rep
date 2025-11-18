extends Sprite2D

@onready var anim = $AnimationPlayer
@onready var are = $Area2D
@onready var sound = $AudioStreamPlayer2D

var isOpen = false



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if !anim.is_playing():
			if !isOpen:
				anim.play("open")
				isOpen=true
			else:
				anim.play("close")
				isOpen=false
			sound.pitch_scale = randf_range(0.5,1.5)
			sound.play()
	pass # Replace with function body.
