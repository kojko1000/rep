extends Node2D
@onready var spr= $AnimatedSprite2D
@onready var timer = $ShakeTimer
@onready var clickParticle = $GPUParticles2D
@onready var animations = $animations

var TrashChertezh = preload( "res://scense/components.tscn")


var curentClick = 0
var clickToLoot = 4
var clickCost = 0.3

var original_position: Vector2
var shake_intensity = 10

func  lootTrash():
	pass
func make_Particle(particl : GPUParticles2D):
	var partkl = particl.duplicate()
	get_tree().root.add_child(partkl)
	partkl.position = get_global_mouse_position()
	partkl.emitting = true
	partkl.finished.connect(partkl.queue_free)

func make_trashComponents(nazva: String):
	var new_trash = TrashChertezh.instantiate()
	add_child(new_trash)
	new_trash.setup("банка")
	new_trash.position = Vector2(randf_range(-25,25),randf_range(-25,25))
	
	pass

func click(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if curentClick < clickToLoot:
			spr.frame = int(curentClick)
			curentClick += clickCost
			make_Particle(clickParticle)
			shake_it()
		else:
			animations.play("end")
			await animations.animation_finished
			curentClick = 0
			spr.frame = 0
			animations.play("start")
		pass
		
		make_trashComponents("1")
		
	pass # Replace with function body.
	
func shake_it():
	var offset = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))
	self.position = original_position + offset * shake_intensity
	timer.start()


func _on_timer_timeout() -> void:
	self.position = original_position
	pass # Replace with function body.


func Sprite_change() -> void:
	print("CHANGE")
	pass # Replace with function body.
