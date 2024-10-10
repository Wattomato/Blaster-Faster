extends Sprite2D

func _ready():
	print(get_path())

var score : int = 0:
	set(value):
		score += value
		$Label.text=str(score)
		
