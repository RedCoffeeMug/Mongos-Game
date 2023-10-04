extends Control

onready var CreditsPanel = get_node("CreditsPanel")


func _ready():
	#Generating text
	var copyright_text = ""
	
	copyright_text += "Made by [url=https://github.com/RedCoffeeMug]RedCoffeeMug[/url]\n"
	copyright_text += "Created using the [url=https://godotengine.org/license/]Godot Game Engine[/url]\n"
	copyright_text += "Using [url=https://fonts.google.com/specimen/Caprasimo/about]Caprasimo Regular Font[/url]"
	
	#license
	var copyright_info = Engine.get_copyright_info()
	copyright_text += "\n\n===THIRD-PARTY COMPONETS===\n"
	for part in copyright_info:
		copyright_text += part["name"] + " - " + part["parts"][0]["license"] + "\n"
	
	#license text
	copyright_text += "\n===LICENSE TEXTS===\n"
	var licenses = Engine.get_license_info()
	for license in licenses:
		copyright_text += "-----" + license + "-----\n" + licenses[license] + "\n\n"
	
	#put text in label
	$CreditsPanel/credits_label.bbcode_text = copyright_text
	
	CreditsPanel.hide()



func _on_StartButton_pressed():
	SceneTransition.change_scene("res://Scenes/House.tscn")


func _on_OptionsButton_pressed():
	pass


func _on_QuitButton_pressed():
	get_tree().quit()


func _process(delta):
	if $BackgroundMusic.playing == false:
		$BackgroundMusic.play()


func _on_CreditsButton_pressed():
	if CreditsPanel.visible == false:
		CreditsPanel.show()
	else:
		CreditsPanel.hide()


func _on_credits_label_meta_clicked(meta):
	OS.shell_open(meta)
