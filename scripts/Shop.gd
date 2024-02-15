extends Node2D

onready var coins = $Coins
onready var pats = $Pats


func _ready():
	coins.text = "Coins: " + str(global.coins)
	pats.text = "Pats: " + str(global.pats)

