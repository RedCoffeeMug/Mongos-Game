extends Node2D

onready var coins = $Coins
onready var pats = $Pats


func _ready():
	coins.text = "Coins: " + str(global.coins)
	pats.text = "Pats: " + str(global.pats)


func _on_Mongo_pats_changed():
	global.pats += 1
	global.coins += 1
	coins.text = "Coins: " + str(global.coins)
	pats.text = "Pats: " + str(global.pats)


func _on_Travel_Button_pressed():
	SceneTransition.change_scene("res://Scenes/Shop.tscn")


func _on_HugMongo_Button_pressed():
	global.coins += 2
	coins.text = "Coins: " + str(global.coins)


func _process(delta):
	
	if $BackgroundMusic.playing == false:
		$BackgroundMusic.play()
