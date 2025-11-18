extends Sprite2D

@onready var mus = $BlatnyakFM
@onready var anim = $AnimationPlayer
@export var on = false
@export var volume = -80	
var musCatalog = [preload("res://sounds/radio music/Butyrka_-_Vtoryaki_ne_chajj_48655870.mp3"),
preload("res://sounds/radio music/radio-mayak-duh-sssr-kto-ne-prosypalsya-pod-eti-zvuki_.mp3")

 ]

		#mus.pitch_scale = randf_range(0.5,1.5)

func click(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if !on:
			mus.volume_db = 0
			anim.play("play")
			on = true
		else:
			anim.stop()
			mus.volume_db = -80
			on = false
		
	pass # Replace with function body.


func _on_ready() -> void:
	mus.stream = musCatalog[randi_range(0,musCatalog.size()-1)]
	mus.play()
	pass # Replace with function body.


func _on_audio_stream_player_2d_finished() -> void:
	mus.stop()
	mus.stream = musCatalog[randi_range(0,musCatalog.size()-1)]
	mus.play()
	pass # Replace with function body.
