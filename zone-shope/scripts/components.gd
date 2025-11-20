extends Node2D

class_name Trash

@onready var sprite_node = $Sprite2D # Назовем по-человечески

# ОБЫЧНАЯ функция настройки, НЕ статическая!
func setup(masty: String):
	var nazva: String
	var cost: int
	var tekstura: Texture2D

	match masty:
		"банка":
			nazva = "Банка"
			cost = 5
			tekstura = preload("res://textures/trash/trash_components/cola.png")
		"стекло-тара":
			nazva = "Стекло-тара"
			cost = 5
			tekstura = preload("res://textures/trash/trash_components/vodka.png")
		"проволка":
			nazva = "Проволка"
			cost = 5
			tekstura = preload("res://textures/trash/trash_components/wire.png")
		_:
			nazva = "Непонятный мусор"
			cost = 1
			tekstura = preload("res://textures/trash/trash_components/cola.png")
	
	# А вот теперь, когда нас уже создали как сцену, мы можем все настроить!
	self.name = nazva
	sprite_node.texture = tekstura
	print("Создан мусор: %s" % nazva)
