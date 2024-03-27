extends Node

func _ready():
	var data = {
		"Pats" : global.pats ,
		"Coins" : global.coins ,
		"Timeofday" : DayTransition.Day ,
		"Muted" : global.is_muted
	}
	
	
	var file = File.new()
	if file.file_exists(global.save_path):
		var error = file.open(global.save_path, File.READ)
		if error == OK:
			var player_data = file.get_var()
			file.close()
			print(player_data)
			for key in data:
				if not key in player_data:
					print("Missing variable " + key + " from save.")
					match key:
						"Coins":
							player_data.Coins = 0
						"Pats":
							player_data.Pats = 0
						"Muted":
							player_data.Muted = false
						"Timeofday":
							player_data.Timeofday = true
			
			global.coins = player_data.Coins
			global.pats = player_data.Pats
			global.is_muted = player_data.Muted
			DayTransition.Day = player_data.Timeofday
