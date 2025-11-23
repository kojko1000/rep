extends Node2D

class_name inventary

var component = preload("res://scense/components.tscn")
@onready var container = $ScrollContainer/VBoxContainer
var shemaContainera = preload("res://scense/inventoryBlock.tscn")
var otstup = 0;
var blocks= []

func pickUpComponent(comp: Trash):
	#Global.inventStat.append(comp)
	makeNewComponentContainer()
	pass

func _ready() -> void:
	
	makeNewComponentContainer()
	makeNewComponentContainer()
	makeNewComponentContainer()
	makeNewComponentContainer()
	makeNewComponentContainer()
	makeNewComponentContainer()

func makeNewComponentContainer():
	var new_box = shemaContainera.instantiate()
	container.add_child(new_box)
	new_box.setSeting(Global.teksturaBanki,"govno","12")
	new_box.position = Vector2(0,otstup)
	blocks.append(new_box)
	otstup += 60
	pass
