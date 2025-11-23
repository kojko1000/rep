extends Node2D

@onready var texturesp :TextureRect  = $PanelContainer/HSplitContainer/TextureRect
@onready var lable1 = $PanelContainer/HSplitContainer/VSplitContainer/Label
@onready var lable2 = $PanelContainer/HSplitContainer/VSplitContainer/Label2


func setSeting(textureSpr: Texture2D,nameCmp:String,count:String):
	texturesp.texture = textureSpr
	lable1.text = nameCmp
	lable2.text = count
	pass

func getName():
	return lable1.text
	pass
