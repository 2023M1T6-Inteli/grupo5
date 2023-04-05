extends Node2D

var rankingData = []

func _ready():
	loadRanking()

	$'1st/Name'.text = rankingData[0]['Name']
	$'1st/Score'.text = str(rankingData[0]['Score'])

	$'2nd/Name'.text = rankingData[1]['Name']
	$'2nd/Score'.text = str(rankingData[1]['Score'])

	$'3rd/Name'.text = rankingData[2]['Name']
	$'3rd/Score'.text = str(rankingData[2]['Score'])


func loadRanking():
	var file = File.new()
	var _rankingFile = file.open('res://ranking.json', File.READ)
	rankingData = parse_json(file.get_as_text())
	file.close()

	var currentPlayer = {
		'Name': Global.playerID,
		'Score': Global.score
	}

	rankingData.append(currentPlayer)
	rankingData.sort_custom(self, 'sort')

	rankingData.pop_back()

	_rankingFile = file.open('res://ranking.json', File.WRITE)
	file.store_string(to_json(rankingData))
	file.close()


static func sort(a, b):
	return a['Score'] > b['Score']


func _input(event):
	if event.is_action_pressed('interact'):
		return get_tree().change_scene('res://scenes/End.tscn')

	if event.is_action_pressed('ui_cancel'):
		return get_tree().change_scene('res://scenes/End.tscn')
