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

	var currentPlayer = {
		'Name': Global.playerId,
		'Score': Global.score
	}
	rankingData.append(currentPlayer)
	rankingData.sort_custom(self, 'sort')


static func sort(a, b):
	return a['Score'] > b['Score']
