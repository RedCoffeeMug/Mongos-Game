extends Node2D

onready var Coins = $Coins
onready var Pats = $Pats
onready var Hugcooldown = $HugMongo_Button/HugCooldown
onready var Hugmongo = $HugMongo_Button
onready var Talkmongo = $TalkMongo
onready var Mongospeech = $MongoSpeaks/Speech
onready var Housebackground = $Background

func _ready():
	Coins.text = "Coins: " + str(global.coins)
	Pats.text = "Pats: " + str(global.pats)
	$InputArea.visible = false
	$MongoSpeaks.visible = false
	Talkmongo.disabled = true
	Hugmongo.disabled = true
	DayTransition.connect("time_changed", self, "_on_time_changed")
	ReadyDayCheck()

func _process(delta):
	if $BackgroundMusic.playing == false:
		$BackgroundMusic.play()


#interacting with Mongo
func _on_Mongo_pats_changed():
	global.pats += 1
	global.coins += 1
	Coins.text = "Coins: " + str(global.coins)
	Pats.text = "Pats: " + str(global.pats)

func _on_TalkMongo_pressed():
	if $InputArea.visible == false:
		$InputArea.visible = true
	else:
		$InputArea.visible = false

func _on_Input_text_entered(new_text):
	$MongoSpeaks.visible = true
	Mongospeech.text = "*Mongo looks at you, he doesn't understand. However he smiles and wishes you joy for the rest of the day*"
	$MongoSpeaks/Timer.start()
	$TalkMongo.disabled = true

func _on_Timer_timeout():
	$MongoSpeaks.visible = false
	global.coins += 11
	Coins.text = "Coins: " + str(global.coins)
	$TalkMongo.disabled = false
	$MongoSpeaks/Timer.stop()

func _on_HugMongo_Button_pressed():
	global.coins += 5
	global.pats += 1
	Coins.text = "Coins: " + str(global.coins)
	Pats.text = "Pats: " + str(global.pats)
	$HugMongo_Button.disabled = true
	Hugcooldown.start()



#Cooldown & disable checks
func _on_HugCooldown_timeout():
	$HugMongo_Button.disabled = false

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



#Shop
func _on_Travel_Button_pressed():
	SceneTransition.change_scene("res://Scenes/Shop.tscn")


#Day and night cycle 
func ReadyDayCheck():
	if DayTransition.Day == true:
		Housebackground.texture = load("res://assets/House-day.png")
	else:
		Housebackground.texture = load("res://assets/House-night.png")

func _on_time_changed():
	if DayTransition.Day == true:
		pass
		#Housebackground.texture = load("res://assets/House-day.png")
	else:
		pass
		#Housebackground.texture = load("res://assets/House-night.png")



#Temp Beta ending
func _on_EndGame_timeout(): #remove after beta
	if global.coins >= 300:
		endgame()
		$Coins/EndGame.stop()

func endgame(): #remove after beta
	SceneTransition.change_scene("res://Scenes/BetaEnd.tscn")
