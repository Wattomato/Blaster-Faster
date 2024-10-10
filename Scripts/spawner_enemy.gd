extends Node
@onready var tim : Timer = $Timer
const enemy = [preload("res://Scenes/Kamikaze.tscn"), preload("res://Scenes/clever_enemy.tscn")]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	var x = randf_range(0.5, 1.25)
	tim.start(x)
	
func spawn() ->void:
	var enemy = enemy.pick_random().instantiate()
	randomize()
	var pos = Vector2()
	pos.x = randi_range(32, get_viewport().size.x-32)
	pos.y = -32
	enemy.position = pos
	get_node("container").add_child(enemy)
	


func _on_timer_timeout():
	spawn() # Replace with function body.
	tim.start(randf_range(0.5, 1))
	
