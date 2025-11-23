extends Node2D

class_name Trash

@onready var sprite_node = $Sprite2D # Назовем по-человечески
var nazva: String
var tekstura: Texture2D
# ОБЫЧНАЯ функция настройки, НЕ статическая!
func setup(masty: String):
	match masty:
		"банка":
			nazva = "Банка"
			tekstura = preload("res://textures/trash/trash_components/cola.png")
		"стекло-тара":
			nazva = "Стекло-тара"
			tekstura = preload("res://textures/trash/trash_components/vodka.png")
		"проволка":
			nazva = "Проволка"
			tekstura = preload("res://textures/trash/trash_components/wire.png")
		_:
			nazva = "Непонятный мусор"
			tekstura = preload("res://textures/trash/trash_components/cola.png")
	
	# А вот теперь, когда нас уже создали как сцену, мы можем все настроить!
	self.name = nazva
	sprite_node.texture = tekstura
	print("Создан мусор: %s" % nazva)



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if(nazva=="Банка"):
			self.queue_free()
			Global.componentBanka += 1
	pass # Replace with function body.
