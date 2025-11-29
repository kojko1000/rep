extends Node3D

@onready var terr = $"../HTerrain"
@onready var mus = $"../RaytracedAudioPlayer3D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !mus.playing:
		mus.play()
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		# Сохраняем текущую маску
		body.collision_mask = 2
		print("Collision disabled")

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		# Восстанавливаем маску (замените 1 на нужный слой)
		body.collision_mask = 1
		print("Collision enabled")
