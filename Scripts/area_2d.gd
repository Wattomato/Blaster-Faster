extends Area2D
signal ouch

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func gotshot():
	ouch.emit()
