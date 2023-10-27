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
	Talkmongo.disabled = true
	Hugmongo.disabled = true


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



func _on_Input_text_entered(new_text):
	$MongoSpeaks.visible = true
	Mongospeech.text = "*Mongo looks at you, he doesn't understand. However he smiles and wishes you joy for the rest of the day*"
	$MongoSpeaks/Timer.start()


func _on_Timer_timeout():
	$MongoSpeaks.visible = false


func _on_CostCheck_timeout():
	if global.pats >= 20:
		Hugmongo.disabled = false
		$HugMongo_Button/RichTextLabel.visible = false
		$HugMongo_Button/CostCheck.stop()
	else:
		$HugMongo_Button/RichTextLabel.visible = true



func _on_TalkCostCheck_timeout():
	if global.pats >= 50:
		Talkmongo.disabled = false
		$TalkMongo/RichTextLabel.visible = false
		$TalkMongo/TalkCostCheck.stop()
	else:
		$TalkMongo/RichTextLabel.visible = true
