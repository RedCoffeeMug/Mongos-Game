extends Node2D

onready var coins = $Coins
onready var pats = $Pats


func _ready():
	coins.text = "Coins: " + str(global.coins)
	pats.text = "Pats: " + str(global.pats)


func _on_MongoHouse_Button_pressed():
	SceneTransition.change_scene("res://Scenes/House.tscn")
