extends Node2D

onready var Coins = $Coins
onready var Pats = $Pats
onready var Hugcooldown = $HugMongo_Button/HugCooldown
onready var Hugmongo = $HugMongo_Button
onready var Talkmongo = $TalkMongo
onready var Mongospeech = $MongoSpeaks/Speech

func _ready():
	Coins.text = "Coins: " + str(global.coins)
	Pats.text = "Pats: " + str(global.pats)
	$HugMongo_Button.disabled = false
	$InputArea.visible = false
	$MongoSpeaks.visible = false


func _on_Mongo_pats_changed():
	global.pats += 1
	global.coins += 1
	Coins.text = "Coins: " + str(global.coins)
	Pats.text = "Pats: " + str(global.pats)


func _on_Travel_Button_pressed():
	SceneTransition.change_scene("res://Scenes/Shop.tscn")


func _on_HugMongo_Button_pressed():
	global.coins += 4
	Coins.text = "Coins: " + str(global.coins)
	$HugMongo_Button.disabled = true
	Hugcooldown.start()


func _process(delta):
	
	if $BackgroundMusic.playing == false:
		$BackgroundMusic.play()


func _on_HugCooldown_timeout():
	$HugMongo_Button.disabled = false


func _on_TalkMongo_pressed():
	if $InputArea.visible == false:
		$InputArea.visible = true
	else:
		$InputArea.visible = false


func _on_ShowButtons_pressed():
	if Hugmongo.visible == false:
		Hugmongo.visible = true
	else:
		Hugmongo.visible = false
	if Talkmongo.visible == false:
		Talkmongo.visible = true
	else:
		Talkmongo.visible = false


func _on_Input_text_entered(new_text):
	$MongoSpeaks.visible = true
	Mongospeech.text = "*Mongo looks at you, he doesn't understand. However he smiles and wishes you joy for the rest of the day*"
	$MongoSpeaks/Timer.start()


func _on_Timer_timeout():
	$MongoSpeaks.visible = false
