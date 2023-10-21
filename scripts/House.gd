extends Node2D

onready var coins = $Coins
onready var pats = $Pats
onready var hugcooldown = $HugMongo_Button/HugCooldown


func _ready():
	coins.text = "Coins: " + str(global.coins)
	pats.text = "Pats: " + str(global.pats)
	$HugMongo_Button.disabled = false


func _on_Mongo_pats_changed():
	global.pats += 1
	global.coins += 1
	coins.text = "Coins: " + str(global.coins)
	pats.text = "Pats: " + str(global.pats)


func _on_Travel_Button_pressed():
	SceneTransition.change_scene("res://Scenes/Shop.tscn")


func _on_HugMongo_Button_pressed():
	global.coins += 4
	coins.text = "Coins: " + str(global.coins)
	$HugMongo_Button.disabled = true
	hugcooldown.start()


func _process(delta):
	
	if $BackgroundMusic.playing == false:
		$BackgroundMusic.play()


func _on_HugCooldown_timeout():
	$HugMongo_Button.disabled = false
